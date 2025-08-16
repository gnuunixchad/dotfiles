# <img src="./misc/dot-repo.png" width="24"/> dotfiles
<img src="./misc/dwl.png" width="1920"/>

My Arch Installation Guide is moved to [codeberg](https://codeberg.org/unixchad/arch-install-guide)/[github](https://github.com/gnuunixchad/arch-install-guide)

## Usage
```sh
# Clone this repository on codeberg
git clone https://codeberg.org/unixchad/dotfiles
# Or on github
git clone https://github.com/gnuunixchad/dotfiles
# Create symlinks with GNU Stow
cd dotfiles
stow -t ~ . --adopt
```
> [!NOTE]
> A few software need manually setup:
> - Software's config named to `*.example` for privacy reasons
> - Software's config listed in `./.stow-local-ignore`
> - Software complied from source, e.g. my build of `dwl`([codeberg](https://codeberg.org/unixchad/dwl)/[github](https://github.com/gnuunixchad/dwl)) and `dam`([codeberg](https://codeberg.org/unixchad/damblocks)/[github](https://github.com/gnuunixchad/damblocks)).
> - For software I don't use anymore(like `sway`), check the git tags.

## Software I Use
I prefer software that are free as in freedom, keyboard centric, terminal based,
vim like, do one thing and do it well. And try to avoid proprietary garbage and
spyware when I can.
```
- /usr/bin/sh:              dash
- Login Shell:              zsh
- Terminlal Multiplexer:    tmux
- Terminal Emulator:        foot
- Audio Server:             pipewire
- WM/Compositor:            dwl & river
- Status bar:               dam & damblocks
- Output Management:        kanshi & wlr-randr
- Application Launcher:     wmenu
- Fuzzy Finder:             fzf
- Notification Daemon:      dunst
- Editor:                   neovim
- Email:                    neomutt & isync
- File manager:             lf
- Music player:             ncmpcpp & mpd
- Video player:             mpv
- Image Viewer:             swayimg
- Ebook Reader:             zathura & mupdf plugin
- Rss Feeder:               newsboat
- Calender:                 calcurse
- Todo:                     taskwarrior
- Virtulization:            kvm & qemu & libvirt
- Privacy/Security:         gpg & firejail & cryptsetup & sbctl
- Web Browser:              qutebrowser & firefox
- Firefox Extension:        tridactyl & darkreader & ublock origin
- Downloader:               transmission-cli & yt-dlp & httrack & curl & wget
- File Sharing:             rsync & ssh & samba & android-file-transfer & qrtool
- Dotfiles Manager:         stow & git
```

## Chinese Video Channel
I have dedicated videos for almost every software I use:

[unixchad at bilibili](https://space.bilibili.com/34569411)

Software I use to create videos:
- Screen Capture:   wf-recorder + slurp
- Voice Recording:  pw-record + noise-suppression-for-voice
- Video Editing:    kdenlive + ffmpeg
- Screenshots:      grim + slurp
- Thumbnails:       gimp + imagemagick

All emails from me will be signed by the same GPG key that I sign commits with:
- Import my key: `gpg --recv-keys 117094DA1AEA0835E4ED0770F7476912AA224CAC`
- Download or copy at [here](./unixchad.asc)

## License
I am the author of every file with the following disclaimer:
```sh
# @author nate zhou
```
I license them under the [GNU GPL-3.0](./LICENSE). There is no warranty, to
the extend permitted by applicable law.

A few scripts or config files come from others, and a credit to the respective
authors should be spotted.
