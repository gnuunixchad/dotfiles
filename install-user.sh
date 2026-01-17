#!/usr/bin/env bash
# @author nate zhou
# @since 2025,2026
# Setup user-space softwares
#set -x

DEPENDENCIES=("git" "stow" "systemctl" "gsettings" "gpg" "fzf" "fc-cache")

DOTFILES_REMOTE=("https://codeberg.org/unixchad/dotfiles" \
                 "https://github.com/gnuunixchad/dotfiles")
DOTFILES_LOCAL="${HOME}/doc/heart"

print_err() {
    local RED='\033[0;31m'
    local RESET='\033[0m'
    echo -e ${RED}${1}${RESET} >&2
}

check_dependencies() {
    local isMissingDependency=0

    for executable in "${DEPENDENCIES[@]}"; do
        if ! command -v "$executable" > /dev/null ; then
            print_err "[Dependency] comamnd '$executable' not found."
            isMissingDependency=1
        fi
    done

    [ "$isMissingDependency" -eq 1 ] && exit 0
}

[ ! -z "$SUDO_USER" ] && print_err "You can't run this script as root." \
    && exit 1

check_dependencies

umask 027
mkdir -p ${HOME}/{dls,doc,mnt,mus,pic,pkg,smb,tmp,vid,.gnupg}
chmod 700 ${HOME}/{doc,mus,pic,vid}/.gpg
chmod 700 ${HOME}/{dls,mnt,tmp}
chmod 755 ${HOME}/pkg
chmod 700 ${HOME}/pkg/{.*,*}
chmod 750 ${HOME}/pkg/fdroid
chmod 705 ${HOME}/pkg/{iso,pacman}

mkdir -p ${HOME}/.{cache/mpd,config/'Code - OSS',local/{share,state/nvim}}

# keep history files locally
mkdir -p ${HOME}/.ollama
touch ${HOME}/.ollama/history
mkdir -p ${HOME}/.local/state/{bash,zsh}
touch ${HOME}/.local/state/{bash,zsh}/history

# Make sure files touched by a cronjob for damblocks is a symlink so they can
# be included by my rsync scripts, so to sync some status to other machines.
mkdir -p ${HOME}/doc/heart/.cache
for i in "wttr" "mbsync.cron" "newsboat.num" "checkupdates-cron.log"; do
    file="${HOME}/doc/heart/.cache/${i}"
    if [ ! -e "$file" ]; then
        touch --date='1970-01-01 00:00:00' "$file"
    fi
done

CITY="${HOME}/.cache/city"
[ ! -f "$CITY" ] || [ -z "$(cat $CITY)" ] && read -p "Enter your city: " \
    && echo "$REPLY" > "$CITY"

[ ! -d "$DOTFILES_LOCAL" ] && \
    git clone "${DOTFILES_REMOTE[1]}" $DOTFILES_LOCAL 2>/dev/null || \
    git clone "${DOTFILES_REMOTE[2]}" $DOTFILES_LOCAL 2>/dev/null

mv ${HOME}/.bash_profile{,~} 2>/dev/null
[ -L "${HOME}/.bashrc" ] || mv ${HOME}/.bashrc{,~}

[ -d ${HOME}/pkg/yay ] && [ ! -L ${HOME}/.cache/yay ] \
    && ln -s ${HOME}/pkg/yay ${HOME}/.cache/yay

[ -d /data/virt ] && [ ! -L ${HOME}/virt ] \
    && (ln -s /data/virt ${HOME}/virt \
        chmod 750 /data/virt
        setfacl -m u:libvirt-qemu:x /data/virt
        )

stow -R --adopt -d "$DOTFILES_LOCAL" -t "$HOME" .
stow -R --adopt -d "${HOME}/pkg/ollama" -t "$HOME" .

[ -x /usr/bin/zsh ] && grep ":${UID}:${GID}:" /etc/passwd  \
                        | grep -q '/usr/bin/zsh'\
                    || chsh -s /usr/bin/zsh

systemctl enable --user ssh-agent.service

command -v gsettings > /dev/null && gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"

SSHCONFIG="${HOME}/.ssh"
[ -f "${SSHCONFIG}/proxy.conf" ] || cp ${SSHCONFIG}/proxy.conf{.example,}

BTOP="${HOME}/.config/btop/btop.conf"
[ -f "$BTOP" ] || cp ${BTOP}.example $BTOP

GIT="${HOME}/.config/git"
[ -f "${GIT}/proxy.inc" ] || cp ${GIT}/proxy.inc{.example,}

MUTT="${HOME}/.config/mutt"
[ -f "${MUTT}/account*.muttrc" ] || cp ${MUTT}/account.{md,muttrc}

NEWSBOAT="${HOME}/.config/newsboat"
[ -f "${NEWSBOAT}/proxy.conf" ] || cp ${NEWSBOAT}/proxy.conf{.example,}
[ -f "${NEWSBOAT}/urls" ] || cp ${NEWSBOAT}/urls{.example,}

QUTEBROWSER="${HOME}/.config/qutebrowser"
[ -f "${QUTEBROWSER}/proxy.py" ] || cp ${QUTEBROWSER}/proxy.py{.example,}

YTDLP="${HOME}/.config/yt-dlp"
[ -f "${YTDLP}/proxy.conf" ] || cp ${YTDLP}/proxy.conf{.example,}

ISYNC="${HOME}/.config/isyncrc"
[ -f "$ISYNC" ] || cp ${ISYNC}.example $ISYNC

GPGKEYS="${HOME}/doc/.gpg/gpg-keys"
[ -d "$GPGKEYS" ] && gpg -q --import $(realpath $(ls ${GPGKEYS}/*.pub \
    | command fzf --prompt="[gpg]: public key to import")) \
    && echo "gpg public keys are imported"
[ -d "$GPGKEYS" ] && gpg -q --import $(realpath $(ls ${GPGKEYS}/*.sec \
    | command fzf --prompt="[gpg]: private key to import")) \
    && echo "gpg secret keys are imported"

CRONTAB="${HOME}/.config/crontab.backup"
[ ! -f "$CRONTAB" ] && CRONTAB="${HOME}/.config/crontab.example"
command -v crontab > /dev/null && crontab $CRONTAB

CALCURSE_ICAL="${HOME}/.config/calcurse/calendar.ical"
CALCURSE_APTS="${HOME}/.local/share/calcurse/apts"
if [ -f "$CALCURSE_ICAL" ] && command -v calcurse > /dev/null; then
    if [ "$(wc -c < $CALCURSE_APTS)"  -ne 0 ]; then
        print_err "[calcurse -i]: Already imported file, skipped"
    else
        calcurse -i $CALCURSE_ICAL || print_err "[calcurse -i]: $CALCURSE_ICAL doesn't exist"
    fi
fi

FONTCONFIG="${HOME}/.config/fontconfig/fonts.conf"
[ -f "FONTCONFIG" ] && fc-cache -fv > /dev/null && echo "font cache generated"

read -p "sync-config-root?(y/n): " choice; [ "$choice" = "y" ] \
    || [ "$choice" = "Y"  ] \
    && ${HOME}/.local/bin/sync-config-root
