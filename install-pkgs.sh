#!/usr/bin/sh
# @author nate zhou
# @since 2026
# Setup packages

#set -x

prefix_cmd_default="echo"
prefix_cmd_pacman="$prefix_cmd_default"
prefix_cmd_aur="$prefix_cmd_default"
prefix_cmd_src_make="$prefix_cmd_default"
prefix_cmd_src_zig="$prefix_cmd_default"

linux="linux"

wlroots_dwl="wlroots0.18"
wlroots_river_classic="wlroots0.19"

usage() {
    cat << _EOF_
USAGE
        $(basename $0) [--install] [--linux KERNEL] OPTION...
        without '--install', only prints the packages to be installed
OPTIONS
        --install   install packages, instead of printing
        --linux linux|linux-lts|linux-zen
                specify version for kernel and headers (default is linux)
        --base
        --yay
        --dwm
        --dwl
        --river-classic
        --ime
        --mutt
        --kvm
        --bluetooth
        --all
_EOF_
    exit 0
}

print_err() {
    local RED='\033[0;31m'
    local RESET='\033[0m'
    echo -e ${RED}${1}${RESET} >&2
}

install_yay() {
    [ -d ${HOME}/pkg/yay ] && [ ! -L ${HOME}/.cache/yay ] \
        && ln -s ${HOME}/pkg/yay ${HOME}/.cache/yay

    local package="$(ls -v ${HOME}/.cache/yay/yay/yay-[0-9]*.pkg.* | tail -1)"
    if [ -f "$package" ]; then
        sudo pacman -U --needed "$package"
    else
        mkdir -p ${HOME}/.cache/yay
        git clone https://aur.archlinux.org/yay.git ${HOME}/.cache/yay/yay
        sudo pacman -S --needed --asdeps go
        makepkg --dir ${HOME}/.cache/yay/yay
        sudo pacman -U --needed "$package"
    fi
}

check_src() {
    repo_prefix="https://codeberg.org/unixchad"
    [ -d "${src_dir}/${package}" ] || {
        mkdir -p $src_dir
        cd $src_dir
        git clone ${repo_prefix}/${package}
        cd -
    }
}

install_make() {
    src_dir="${HOME}/.local/src"

    for package in $src_make; do
        check_src "$src_dir"
        cd ${src_dir}/${package}
        sudo make install
        cd -
    done
}

install_zig() {
    src_dir="${HOME}/.local/src"

    for package in $src_zig; do
        check_src "$src_dir"
        cd ${src_dir}/${package}
        sudo zig build -Doptimize=ReleaseSafe --prefix /usr/local install
        cd -
    done
}

add_linux() {
    pkg="$pkg $linux"
    pkg="$pkg ${linux}-headers"
}

add_ucode_amd() {
    pkg="$pkg amd-ucode"
}

add_ucode_intel() {
    pkg="$pkg intel-ucode"
}

add_ucode() {
    local vendor="$(lscpu | grep 'Vendor ID:' | sed 's/Vendor ID:[[:space:]]*//g')"
    case "$vendor" in
        GenuineIntel)
            add_ucode_intel
            ;;
        AuthenticAMD)
            add_ucode_amd
            ;;
        *)
            print_err "[add_ucode]: Unknown CPU vendor: $vendor"
            ;;
    esac
}

add_nvidia() {
    pkg="$pkg nvidia-open-dkms"
    pkg="$pkg nvidia-utils"
}

add_amd() {
    pkg="$pkg"
}

add_gpu() {
    local vendor="$(lspci | grep 'VGA compatible controller: ')"
    echo "$vendor" | grep -q 'NVIDIA Corporation' && add_nvidia
    echo "$vendor" | grep -q 'Advanced Micro Devices' && add_amd
}

add_base() {
    add_linux; add_ucode; add_gpu

    pkg="$pkg base"
    pkg="$pkg base-devel"
    pkg="$pkg linux-firmware"
    pkg="$pkg lvm2"
    pkg="$pkg vim"
    pkg="$pkg networkmanager"
    pkg="$pkg man-db"
    pkg="$pkg man-pages"
    pkg="$pkg bash-completion"

    pkg="$pkg dash"
    pkg="$pkg zsh"
    pkg="$pkg zsh-syntax-highlighting"

    pkg="$pkg sbctl"
    pkg="$pkg efibootmgr"
    pkg="$pkg udisks2"

    pkg="$pkg openssh"
    pkg="$pkg openbsd-netcat"

    pkg="$pkg arch-install-scripts"
    pkg="$pkg dosfstools"
    pkg="$pkg exfat-utils"

    pkg="$pkg archlinux-contrib"
    pkg="$pkg pacman-contrib"
    pkg="$pkg rebuild-detector"

    pkg="$pkg neovim"
    pkg="$pkg nodejs"

    pkg="$pkg firejail"
    pkg="$pkg ufw"

    pkg="$pkg btop"
    pkg="$pkg nvtop"
    pkg="$pkg ncdu"
    pkg="$pkg smartmontools"
    pkg="$pkg sysstat"
    pkg="$pkg iftop"
    pkg="$pkg powertop"

    pkg="$pkg bat"
    pkg="$pkg bc"
    pkg="$pkg cronie"
    pkg="$pkg fzf"
    pkg="$pkg git"
    pkg="$pkg lf"
    pkg="$pkg rsync"
    pkg="$pkg samba"
    pkg="$pkg stow"
    pkg="$pkg tree"
    pkg="$pkg unzip"
    pkg="$pkg w3m"
    pkg="$pkg zip"

    src_make="$src_make abduco"
    src_make="$src_make dvtm"
}

add_audio() {
    pkg="$pkg pipewire"
    pkg="$pkg pipewire-alsa"
    pkg="$pkg pipewire-pulse"
    pkg="$pkg pipewire-jack"
    pkg="$pkg noise-suppression-for-voice"
    pkg="$pkg pulsemixer"
}

add_fonts() {
    pkg="$pkg adobe-source-code-pro-fonts"
    pkg="$pkg noto-fonts"
    pkg="$pkg noto-fonts-cjk"
    pkg="$pkg noto-fonts-emoji"
    pkg="$pkg noto-fonts-extra"
    pkg="$pkg woff2-font-awesome"
    pkg="$pkg ttf-nerd-fonts-symbols"
}

add_themes() {
    pkg="$pkg gnome-themes-extra"

    aur="$aur adwaita-qt5-git"
    aur="$aur adwaita-qt6-git"
}

add_xorg() {
    pkg="$pkg xorg-server"
    pkg="$pkg xorg-xinit"
    pkg="$pkg xorg-xrandr"
    pkg="$pkg xorg-xsetroot"
    pkg="$pkg xorg-xset"
    pkg="$pkg xsel"
    pkg="$pkg xwallpaper"
    pkg="$pkg xorg-xkill"
    pkg="$pkg xorg-xev"
    pkg="$pkg xorg-xinput"
    pkg="$pkg unclutter"
    pkg="$pkg xss-lock"
    pkg="$pkg xdotool"
    pkg="$pkg slock"
    pkg="$pkg picom"
    pkg="$pkg redshift"
    pkg="$pkg clipmenu"
    pkg="$pkg maim"
    pkg="$pkg slop"
    pkg="$pkg autorandr"
    pkg="$pkg screenkey"
    pkg="$pkg dunst"
    pkg="$pkg brightnessctl"
    pkg="$pkg libnotify"

    src_make="$src_make st"
    src_make="$src_make dmenu"
    src_make="$src_make nsxiv"
    src_make="$src_make xob"
    src_make="$src_make xbanish"
}

add_dwm() {
    add_xorg; add_audio; add_fonts; add_themes

    src_make="$src_make dwm"
}

add_wayland() {
    pkg="$pkg foot"
    pkg="$pkg wlr-randr"
    pkg="$pkg kanshi"
    pkg="$pkg wl-clipboard"
    pkg="$pkg cliphist"
    pkg="$pkg wf-recorder"
    pkg="$pkg wl-mirror"
    pkg="$pkg swaybg"
    pkg="$pkg swayidle"
    pkg="$pkg waylock"
    pkg="$pkg wmenu"
    pkg="$pkg wtype"
    pkg="$pkg libnotify"
    pkg="$pkg dunst"
    pkg="$pkg gammastep"
    pkg="$pkg slurp"
    pkg="$pkg grim"
    pkg="$pkg wob"
    pkg="$pkg wev"
    pkg="$pkg tllist"
    pkg="$pkg wayland-protocols"
    pkg="$pkg sway"
    pkg="$pkg wlroots0.19"
    pkg="$pkg xorg-xwayland"
    pkg="$pkg xwayland-satellite"
    pkg="$pkg brightnessctl"

    aur="$aur wshowkeys-mao-git"
    aur="$aur lswt"
    aur="$aur wlrctl"
}

add_dwl() {
    add_wayland; add_audio; add_fonts; add_themes

    pkg="$pkg $wlroots_dwl"

    src_make="$src_make dwl"
}

add_river_classic() {
    add_wayland; add_audio; add_fonts; add_themes

    pkg="$pkg zig"
    pkg="$pkg $wlroots_river_classic"
    pkg="$pkg scdoc"
    pkg="$pkg tllist"
    pkg="$pkg wayland-protocols"

    src_make="$src_make dam"
    src_make="$src_make river-shifttags"

    src_zig="$src_zig river-classic"
}

add_media() {
    pkg="$pkg ffmpeg"
    pkg="$pkg python-mutagen"
    pkg="$pkg imagemagick"
    pkg="$pkg mediainfo"
    pkg="$pkg perl-image-exiftool"
    pkg="$pkg perl-rename"
    pkg="$pkg catimg"
    pkg="$pkg chafa"
    pkg="$pkg ffmpegthumbnailer"
    pkg="$pkg gnome-epub-thumbnailer"
    pkg="$pkg lsix"
    pkg="$pkg odt2txt"
    pkg="$pkg 7zip"
    pkg="$pkg unrar-free"
}

add_gui_editor() {
    pkg="$pkg kdenlive"
    pkg="$pkg gimp"
    pkg="$pkg libreoffice-still"
}

add_ime() {
    pkg="$pkg fcitx5"
    pkg="$pkg fcitx5-chinese-addons"
    pkg="$pkg fcitx5-configtool"
    pkg="$pkg fcitx5-gtk"
    pkg="$pkg fcitx5-qt"
    pkg="$pkg fcitx5-anthy"

    aur="$aur fcitx5-skin-fluentdark-git"
}

add_downloader() {
    pkg="$pkg yt-dlp"
    pkg="$pkg yt-dlp-ejs"
    pkg="$pkg transmission-cli"
    pkg="$pkg httrack"
    pkg="$pkg wget"
}

add_games() {
    pkg="$pkg ttyper"
}

add_dict() {
    pkg="$pkg dictd"

    aur="$aur dict-gcide"
    aur="$aur dict-wm"
}

add_mutt() {
    pkg="$pkg neomutt"
    pkg="$pkg isync"

    aur="$aur cyrus-sasl-xoauth2-git"
}

add_coding() {
    pkg="$pkg jdk-openjdk"
    pkg="$pkg openjdk-src"
    pkg="$pkg openjdk-doc"
    pkg="$pkg nodejs"
    pkg="$pkg tree-sitter-cli"
    pkg="$pkg code"
}

add_kvm() {
    pkg="$pkg libvirt"
    pkg="$pkg dnsmasq"
    pkg="$pkg virt-install"
    pkg="$pkg virt-manager"
    pkg="$pkg qemu-base"
    pkg="$pkg openbsd-netcat"
    pkg="$pkg qemu-hw-display-qxl"
    pkg="$pkg qemu-hw-display-virtio-gpu"
    pkg="$pkg qemu-hw-display-virtio-gpu-pci"
    pkg="$pkg qemu-chardev-spice"
    pkg="$pkg qemu-audio-spice"
}

add_bluetooth() {
    pkg="$pkg bluetui"
    pkg="$pkg bluez-utils"
}

add_extra() {
    pkg="$pkg android-file-transfer"
    pkg="$pkg qrtool"

    pkg="$pkg ollama"

    pkg="$pkg arch-wiki-docs"
    pkg="$pkg calc"

    pkg="$pkg task"
    pkg="$pkg calcurse"
    pkg="$pkg newsboat"

    pkg="$pkg tlp"

    pkg="$pkg zathura"
    pkg="$pkg zathura-pdf-mupdf"

    pkg="$pkg mpv"
    pkg="$pkg swayimg"
    pkg="$pkg ncmpcpp"
    pkg="$pkg mpd"
    pkg="$pkg mpc"

    pkg="$pkg qutebrowser"
    pkg="$pkg python-adblock"
}


[ ! -z "$SUDO_USER" ] && print_err "You can't run this script as root." \
    && exit 1

[ -z "$1" ] && usage

while [ -n "$1" ]; do
    case "$1" in
        --install)
            prefix_cmd_pacman="sudo pacman -S --needed"
            prefix_cmd_aur="yay -S --needed"
            prefix_cmd_src_make="install_make"
            prefix_cmd_src_zig="install_zig"
            ;;
        --linux)
            shift
            linux="$1"
            add_linux
            ;;
        --base)
            add_base
            ;;
        --yay)
            install_yay
            ;;
        --dwm)
            add_dwm
            ;;
        --dwl)
            add_dwl
            ;;
        --river-classic)
            add_river_classic
            ;;
        --ime)
            add_ime
            ;;
        --mutt)
            add_mutt
            ;;
        --kvm)
            add_kvm
            ;;
        --bluetooth)
            add_bluetooth
            ;;
        --all)
            add_base
            install_yay
            add_dwm
            add_river_classic
            add_media
            add_gui_editor
            add_ime
            add_downloader
            add_games
            add_dict
            add_mutt
            add_coding
            add_kvm
            add_bluetooth
            add_extra
            ;;
    esac
    shift
done

[ -n "$pkg" ] && {
    echo "pacman: "
    $prefix_cmd_pacman $pkg
    echo
}

[ -n "$aur" ] && {
    echo "AUR: "
    command -v yay 2>/dev/null && install_yay
    $prefix_cmd_aur $aur
    echo
}

[ -n "$src_make" ] && {
    echo "Source(make): "
    $prefix_cmd_src_make $src_make
    echo
}

[ -n "$src_zig" ] && {
    echo "Source(zig): "
    $prefix_cmd_src_zig $src_zig
    echo
}
