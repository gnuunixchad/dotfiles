#!/usr/bin/env bash
# @author nate zhou
# @since 2025
# Setup system-wide softwares
#set -x

sudoer="$(grep ':1000:1000:' /etc/passwd | cut -d':' -f1)"

DOTFILES_LOCAL="/home/${sudoer}/doc/heart"
hostname="$(cat /etc/hostname)"
ARCH_LIST="${DOTFILES_LOCAL}/package-list/arch-${hostname}.list"

print_err() {
    local RED='\033[0;31m'
    local RESET='\033[0m'
    echo -e ${RED}${1}${RESET}
}

[ ! "$UID" -eq 0 ] && print_err "You must run this script as root." && exit 1

pacman --noconfirm -Sy && pacman -S --noconfirm --needed archlinux-keyring

[ -f "$ARCH_LIST" ] && pacman -S --noconfirm --needed $(cat "$ARCH_LIST") \
    2>/dev/null || print_err "package list not found, no packages installed"

[ -z "$(pdbedit -Lv)" ] && smbpasswd -a "$sudoer"

usermod "$sudoer" -aG kvm,libvirt

grep -q '^termux:' /etc/passwd || useradd -m -G "$sudoer" termux

[ -f /root/.bash_profile ] && mv /root/.bash_profile{,~}
[ -L "/root/.bashrc" ] || mv /root/.bashrc{,~}

cp -r --preserve=mode ${DOTFILES_LOCAL}/{etc,usr} /

timedatectl set-ntp true
systemctl enable --now systemd-timesyncd.service

ufw allow from 192.168.0.0/16 to any app SSH
ufw allow from 192.168.0.0/16 to any app CIFS
ufw allow in on virbr0 from any to any
ufw enable
systemctl enable --now ufw.service

firecfg >/dev/null 2>/dev/null && echo "firejail symlink created"

systemctl enable --now systemd-boot-update.service
systemctl enable --now bluetooth.service
systemctl enable --now reflector.timer
systemctl enable --now tlp.service
systemctl enable --now smb.service
systemctl enable --now dictd.service

lscpu | grep -q 'Hypervisor vendor:' \
    || (systemctl enable --now libvirtd \
    && virsh net-define /etc/libvirt/qemu/networks/default.xml \
    && virsh net-autostart default)

pacman -Qi nvidia-utils > /dev/null 2>&1 \
    && (systemctl enable nvidia-suspend.service; \
        systemctl enable nvidia-hibernate.service; \
        systemctl enable nvidia-resume.service; \
        systemctl enable nvidia-powerd.service; \
        echo "Nvidia power management service will be enabled after a reboot.")

systemctl disable --now paccache.timer
