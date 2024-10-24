@title: Arch Linux Installation With Sway Wayland Compositor  
@author: nate zhou  
@since: 2024-08-07  

You can find this repository on:  
[unixchad on codeberg](https://codeberg.org/unixchad/dotfiles)  
[gnuunixchad on github](https://github.com/gnuunixchad/dotfiles)  

My Video Chanels(Chinese):  
[unixchad on bilibili](https://space.bilibili.com/34569411)  
[unixchad on ixigua](https://www.ixigua.com/home/59251857670)  

**Disclaimer**:  
This file only serves as a record rather than a guide or tutorial.  
It is based on the [arch wiki](https://wiki.archlinux.org/title/Installation_guide), which is the better guide, if not the best.
# 0.install info
partition:  LVM on LUKS
boot:       GRUB, UEFI, Secure Boot disabled)
```
 lsblk example:
    NAME              SIZE  TYPE  MOUNTPOINTS
    nvme0n1         476.9G  disk  
    ├─nvme0n1p1         1G  part  /boot
    ├─nvme0n1p2        76G  part  
    │ └─cryptlvm       76G  crypt 
    │   ├─vg0-swap     16G  lvm   [SWAP]
    │   └─vg0-root     60G  lvm   /
    └─nvme0n1p3     399.9G  part  
      └─crypthome   399.9G  crypt /home
```
# 1. archiso
## 1.1 ventoy
w    bootable iso usb drive created with ventoy-1.0.99
## 1.2 increase console font
    `setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu.gz`
## 1.3 connect to wifi (hidden)
    (optional) get full manual of iwctl
    `iwctl help | less`

    list network interface(s)
    `iwctl device list`

    connect hidden wifi
    `iwctl --passphrase <passphrase> station <device> connect-hidden <ssid>`
## 1.4 update the system clock
    `timedatectl set-timezon Region/City`

    (optional) check NTP
    `timedatectl`
## 1.5 (optional) partition disk(s)
    (optional) read `fdisk`'s manual
    `fdisk /dev/nvme0n1 <<< m | less`

    `<<<` is the "here string", this command send `m` to `fdisk /dev/nvme0n1` and piping to `less`, useful when console screen isn't enough
## 1.6 (optional) format partition(s)
    format the bootloader's partition
    `mkfs.fat -F 32 /dev/nvme0n1p1`

    format the encrypt partitions (only giving 1 example)
    `cryptsetup luksFormat /dev/nvme0n1p2`

    unlock the encrypted partitions
    `cryptsetup open /dev/nvme0n1p2 cryptlvm`
    `cryptsetup open /dev/nvme0n1p3 crypthome`

    create physical volume for LVM on the top of the LUKS container
    `pvcreate /dev/mapper/cryptlvm`

    create the volume group for LVM, name it `vg0`
    `vgcreate vg0 /dev/mapper/cryptlvm`

    create the logical volumes inside the volume group
    `lvcreate -L 16G vg0 -n swap`
    `lvcreate -l 100%FREE vg0 -n root`

    format the logical volumes for root
    `mkfs.ext4 /dev/vg0/root` (or `mkfs.ext4 /dev/mapper/vg0-root`, both paths links to the same device `/dev/dm-2)

    format the logical volumes for swap
    `mkswap /dev/vg0/swap`

    format the crypted home
    'mkfs.ext4 /dev/mapper/crypthome'
## 1.7 mount partitions
    mount root (ext4 on lvm on luks)
    `mount /dev/vg0/root /mnt` 

    create mount points for other partitions
    `mkdir -p /mnt/{boot,home}`

    mount boot (esp, not encrypted)
    `mount /dev/nvme0n1p1 /mnt/boot` 

    mount home (ext4 on luks)
    `mount /dev/mapper/crypthome /mnt/home`

    enable swap (swap on lvm on luks)
    `swapon /dev/vg0/swap`
## 1.8 install the operating system and linux kernel
    enable parallel downloads for pacman
    `vim /etc/pacman.conf`
    uncomment
    `#ParallelDownloads = 5`

    add a mirrorlist
    `vim /etc/pacman.d/mirrorlist`
    add on top
    `Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch`

    install packages
    `pacstrap -K /mnt base base-devel linux-lts linux-lts-headers linux-firmware intel-ucode cryptsetup lvm2 vim neovim networkmanager man-db bash-completion`

    (explaining packages
        base            minimal package set to define a basic arch linux installation
        base-devel      basic tools to build arch linux packages
        linux-lts       kernel
        intel-ucode     ucode for intel cpu, amd cpu install `amd-ucode`
        lvm2            if this package is not installed, root filesystem on the logical volume won't be able to be used
        man-db          database for `man`
        bash-completion completion for sub-commands
    )  
## 1.9 generate fstab
    `genfstab -U /mnt >> /mnt/etc/fstab`
## 1.10 chroot into the new system
    `arch-chroot /mnt`
## 1.11 configure timezone and clock
    make a symbolic link to a timezone
        `ln -sf /usr/share/zoneinfo/Region/City /etc/localtime`
    
    sync system time to the hardware clock on the computer's motherboard
        `hwclock --systohc`
## 1.12 configure locale
    `vim /etc/locale.gen`

    uncomment the line
    `#en_US.UTF-8 UTF-8`

    `locale-gen`

    `vim /etc/locale.conf`

    add
    `LANG=en_US.UTF-8`
## 1.13 create hostname
    `echo fx507 >> /etc/hostname`
## 1.14 configure localhost
    `vim /etc/hosts`
    add
    ```
    127.0.0.1       localhost
    ::1             localhost
    127.0.1.1       fx507.localdomain fx507
    ```
## 1.15 add a key file to luks container
    cd /root

    dd if=/dev/urandom of=/root/cryptkey bs=1024 count=4

    chmod 400 cryptkey

    cryptsetup luksAddKey /dev/nvme0n1p3 /root/cryptkey

    blkid >> /etc/crypttab

    vim /etc/crypttab
    
    modify to
        crypthome <uuid> /root/cryptkey luks,discard
        (uuid of the luks containers)
## 1.15.1 (optional) kill no longer used key slot
    cryptsetup luksDump /dev/nvme0n1p3 | less
    cryptsetup luksKillSlot /dev/nvme0n1p3 1
## 1.16 create initial ramdisk environment
    `vim /etc/mkinicpio.conf`

    add `encrypt`, `lvm2` and `resume` hooks and modify the line to
    `HOOKS=base udev autodetect microcode modconf kms keyboard keymap consolefont block encrypt lvm2 filesystems resume fsck`

    the kernel modules **MUST** be called by the order
        - block (block device)
        - encrypt (decrypt luks container)
        - lvm2 (load logical volumes)
        - filesystems
        - resume
        - fsck

    build initramfs image(s) according to all presets
    `mkinitcpio -P`
## 1.17 configure root and new user
    create root password
    `passwd`

    create new user, adding to the wheel group, creating home directory if not existing
    `useradd -G wheel -m nate`
    `passwd nate`

    allow users of wheel group to use sudo
    `visudo`

    uncomment:
    `# %wheel ALL=(ALL:ALL) ALL`
## 1.18 install and config GRUB
    install grub
    `pacman -Syu grub efibootmgr`

    backup the default grub config
    `cp /etc/default/grub /etc/default/grub~`

    tell grub where the encrypted root partition is
    `blkid >> /etc/default/grub`

    modify the line
    `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"`

    into
    `GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 cryptdevice=UUID=<uuid>:cryptlvm root=UUID=<uuid>"`
        - cryptdevice is the partition of luks container (in this case /dev/nvme0n1p2)
        - root is the logical volume partition (in this case /dev/vg0/root)

    install GRUB to the /boot
    `grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`

    generate the GRUB configuration file
    `grub-mkconfig -o /boot/grub/grub.cfg`
## 1.19 finish arch install
    leave chroot
    `exit`

    unmount partitions
        umoun -R /mnt
        swapoff -a

        reboot
# 2. post installation
login as root
## 2.1 setfont again temporally
    `setfont /usr/share/kbd/consolefonts/iso01-12x22.psfu.gz`
## 2.2 set tty font permanently (take effect after reboot)
    `sudo vim /etc/vconsole.conf`
    append:
        FONT=iso01-12x22
## 2.3 copy the default bashrc
    `cp /etc/bash.bashrc /root/.bashrc`
    (or from /etc/skel/.bashrc)
    add `set -o vi` to it

    (optional) remove the `~/.bash_profile` if exist 
    as `~/.bash_profile` would override `~/.profile`
## 2.4 enable networkmanager and connect to hidden wifi
    `systemctl enable --now NetworkManager.service` (`.service` can be omitted)

    run the following twice, as the first attemp would failed for ssid not found
    `nmcli device wifi connect <ssid> password <password> hidden yes`
## 2.5 install user packages
    ### basic tools
    vim neovim ranger fzf tmux git rsync openssh openbsd-netcat udisks2 zip unzip tree calc pacman-contrib archlinux-contrib arch-install-scripts dosfstools exfat-utils

    ### system configuration
    networkmanager brightnessctl tlp ntp ufw firejail cronie

    ### system monitoring
    btop ncdu iftop sysstat smartmontools

    ### file sharing
    android-file-transfer samba

    ### web browser
    w3m firefox firefox-dark-reader firefox-tridactyl firefox-ublock-origin

    ### window manager/wayland compositor suite
    (choose pipewire packages when asking for dependencies for audio server)
    foot sway swaybg swayidle swaylock waybar wmenu wtype wl-clipboard wlroots xorg-xwayland cliphist dunst gammastep slurp grim wf-recorder wl-mirror

    ### audio server
    pipewire pipewire-alsa pipewire-pulse pipewire-jack

    ### fonts
    adobe-source-code-pro-fonts noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-font-awesome ttf-nerd-fonts-symbols

    ### file viewer
    imv zathura zathura-pdf-mupdf

    ### typing practice in terminal
    ttyper

    ### multi-media player
    mpv ncmpcpp mpd mpc

    ### multi-media editor
    ffmpeg iffmpegthumbnailer id3v2 imagemagick mediainfo perl-image-exiftool perl-rename 

    ### virtualization
    virtualbox virtualbox-guest-iso virt-manager qemu

    ### input method engine
    fcitx5 fcitx5-chinese-addons fcitx5-configtool fcitx5-gtk fcitx5-qt

    ### downloader & torrent
    yt-dlp transmission-cli httrack

    ### personal tools
    neomutt newsboat task calcurse
    ### normie's email client due to compulsory oauth2 
    thunderbird thunderbird-dark-reader

    ### coding
    (code on archlinux official repo is actually the free software Code-OSS, instead of proprietary VSCode)
    jdk-openjdk openjdk-src code

    ### themes
    xdg-desktop-portal lxappearance gnome-themes-extra qt5ct

    ### video driver (nvidia only)
    nvidia-open-dkms nvidia-utils nvtop

    ### editor
    libreoffice-still gimp

    ### (optional) media editor
    kdenlive obs-studio xdg-desktop-portal-wlr
## 2.5.1 (optional) install sway from aur
    ### not in official arch repository
    yay-bin
    fcitx5-skin-fluentdark-git

    ### fix: fcitx display
    sway-git

    ### features: get sixel image preview in foot
    ranger-git
    
    ### fix: replace ranger's bulkrename (broken due to ncurses update)
    brn2-git

### [example] compile and install
    git clone https://aur.archlinux.org/yay-bin.git
    makepkg
    sudo pacman -U yay-bin-xxx.pkg.tar.zst

    yay -Syu brn2 ranger-git sway-git fcitx5-skin-fluentdark-git adwaita-qt5 adwaita-qt6 mpvpaper

## 2.6 config softwares
### 2.6.0 pacman
remove unused packages weekly by `paccache` command from `pacman-contrib` package. (default keeps the last 3 versions of a package)
    systemctl enable --now paccache.timer
### 2.6.1 tlp battery charing threshold
    sudo vim /etc/tlp.conf
    STOP_CHARGE_THRESH_BAT1=80
    sudo systemctl enable --now tlp.service
### 2.6.2 mandb database update
    sudo mandb
### 2.6.3 (optional) change grub resolution
    sudo vim /etc/default/grub
    GRUB_GFXMODE=1366x768
### 2.6.5 calcurse import calendar
    import calendar data file
        calcurse -i ~/.config/calcurse/calendar.ical
### 2.6.6 samba server
    copy smb.conf to /etc/samba/smb.conf
        curl 'https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default' sudo tee /etc/samba/smb.conf

    adding a user to samba server
        sudo smbpasswd -a nate

    enable smb service
        sudo systemctl enable --now smb.service
### 2.6.7 ntp time sync
    systemctl enable --now ntpd.service
    timedatectl set-ntp true
### 2.6.8 sshd force loggin in with key file
    `sudo vim /etc/ssh/sshd_config`
    modify the line:
        #PasswordAuthentication yes
    into:
        PasswordAuthentication no

    restart sshd
        systemctl enable --now sshd.service
#### 2.6.8.1 (optional) import ssh pub key (on nuc11)
    entering the directory where the pub key locates
        cd ~/.ssh
    use smbclient to move pub key to nuc11
        smbclient //192.168.xx.xx/smb -U nate

        (`-U nate` can be omitted if samba server's user name is the same)
        (share name shall be identical in /etc/samba/smb.conf like [smb])

    in smbclient's shell, copy the local file to the server
        put ~/.ssh/id_rsa.pub

    on the samba server, import pub key for sshd
        cat ~/smb/id_rsa.pub >> ~/.ssh/authorized_keys
        sudo systemctl restart sshd.service
### 2.6.9 termux file syncing to android phone setup
    create termux user for syncing files to android phone
        sudo useradd -m termux
    add user termux to the nate group
        sudo usermod -aG nate termux

    on termux copy `~/.ssh/id_rsa.pub`, write to clipboard.txt on smb share

    (optional) if on wayland, copy to paste
        cat ~/smb/clipboard.txt | wl-copy
        
    change user to termux with sudo (never create password for the termux user)
        sudo su - termux
        mkdir ~/.ssh

    import pub key to sshd
        echo "<paste pub key here>" > .ssh/authorized_keys
    
    restart sshd
        sudo systemctl restart sshd.service
#### 2.6.9.1 check home directory permission for sharing files
    make home directory r-x for group nate
        `chmod 750 ~`

    make directories for sharing r-x for group nate
        `chmod g+rx ~/doc ~/pic ~/mus ~/vid ~/repo`

    remove all permisions for other directories  for group nate
        `chmod g-rwx ~/.config ~/.local ~/.ssh ~/mnt ~/smb`

    (to sync to android phone, run the following in termux:
    `rsync -avh --delete --progress --ignore-errors --exclude .git termux@192.168.xx.xx:/home/nate/{doc,mus,pic,vid} storage/shared/back/`
    )
### 2.6.10 ufw rules
    allow incoming trafic from LAN through ssh port
        sudo ufw allow from 192.168.0.0/16 to any app SSH

    allow incoming trafic from LAN through CIFS port for Samba server:
        sudo ufw allow from 192.168.0.0/16 to any app CIFS

    enable ufw
        sudo systemctl enable --now ufw.service
### 2.6.11 firejail sandbox
    (optional) comment out `mkdir` lines to disable creating empty directories on starting up softwares
        sudo vim /etc/firejail/newsboat.profile
        sudo vim /etc/firejail/neomutt.profile

    start firejail
        `sudo firecfg`
### 2.6.12 virtualbox setup
    sudo usermod -aG vboxusers nate
### 2.6.13 electron software (code/codium) themes on wayland
    make sure xdg-desktop-portal package is installed and run:
        gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
### 2.6.14 (optional) nvidia fix hibernation
    (linux-lts 6.6.56-1 nvidia-open-dkms 560.35.03-16)
    sudo systemctl enable nvidia-suspend.service
    sudo systemctl enable nvidia-hibernate.service
    sudo systemctl enable nvidia-resume.service
    sudo systemctl enable nvidia-powerd.service
### 2.6.15 (optional) change default power button behavior
    sudo cp /etc/systemd/logind.conf /etc/systemd/logind.conf~
    sudo vim /etc/systemd/logind.conf

    uncomment and modify line to:
    HandlePowerKey=hibernate

# 3.0 (optional) restore files from a backup media
    unlock and mount the backup disk
        udisksctl unlock -b /dev/sdx1
        udisksctl mount -b /dev/dm-x

    sync to home directory
        rsync -avh --delete --progress /run/media/nate/usb-ssd0/back/{aur,doc,mus,pic,repo,vid} /home/nate/

    unmount and lock the device
        udisksctl unmount -b /dev/dm-x
        udisksctl lock -b /dev/sdx1
        udisksctl poweroff -b /dev/sdx
