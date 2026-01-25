# <img src="./misc/dot-repo.png" width="24"/> dotfiles
<img src="./misc/kwm.png" width="1920"/>

My Arch Installation Guide is moved to [codeberg](https://codeberg.org/unixchad/arch-install-guide)/[github](https://github.com/gnuunixchad/arch-install-guide)

## Usage
```sh
# Clone this repository on codeberg
git clone https://codeberg.org/unixchad/dotfiles
# Or on github
git clone https://github.com/gnuunixchad/dotfiles

# Create directories if needed to avoid dumping everything in dotfiles directory
mkdir -p ${HOME}/.local/{share,state}
mkdir -p ${HOME}/.{cache,config/"Code -OSS"}

# Create symlinks with GNU Stow
cd dotfiles
stow -t ~ . --adopt

# Optionally, run my post-install scripts AT YOUR OWN RISK
sudo ./install-root.sh
./install-user.sh

```
> [!NOTE]
> A few software need manually setup:
> - Software's config named to `*.example` for privacy reasons
> - Software's config listed in `./.stow-local-ignore`
> - Software complied from source, e.g. my build of `kwm`([codeberg](https://codeberg.org/unixchad/kwm)/[github](https://github.com/gnuunixchad/kwm)) and `dwl`([codeberg](https://codeberg.org/unixchad/dwl)/[github](https://github.com/gnuunixchad/dwl)).
> - For `river-0.3.x` configs, check the git branch `river-classic`
> - For software I don't use anymore(like `sway`), check the git tags.

## Software I Use
I prefer software that are free as in freedom, keyboard centric, terminal based,
vim like, do one thing and do it well. And try to avoid proprietary garbage and
spyware when I can.
- /usr/bin/sh:              `dash`
- Login Shell:              `zsh`
- Terminal Multiplexer:     `abduco`, `dvtm`
- Terminal Emulator:        `foot`
- Audio Server:             `pipewire`
- Compositor:               `river`, `dwl`
- Window Manager:           `kwm`
- Status Line:              `damblocks`
- Output Management:        `wlr-randr`, `kanshi`
- Application Launcher:     `wmenu`
- Fuzzy Finder:             `fzf`
- Notification Daemon:      `dunst`
- Editor:                   `neovim`
- Email:                    `neomutt`, `isync`
- File manager:             `lf`
- Music player:             `mpd`, `ncmpcpp`
- Video player:             `mpv`
- Image Viewer:             `swayimg`
- Ebook Reader:             `zathura`, `zatura-pdf-mupdf`
- Rss Feeder:               `newsboat`
- Calender:                 `calcurse`
- Todo:                     `taskwarrior`
- Virtualisation:           `qemu`, `libvirt`, `virtmanager`
- Privacy/Security:         `cryptsetup`, `sbctl`, `gpg`, `firejail`
- Web Browser:              `w3m`, `qutebrowser`
- Downloader:               `curl`, `wget`, `transmission-cli`, `yt-dlp`, `httrack`
- File Sharing:             `rsync`, `samba`, `android-file-transfer`, `qrtool`
- Dotfiles Manager:         `git`, `stow`
- Idle Manager:             `swayidle`
- Session Lock:             `swaylock`
- Clipboard Manager:        `wl-Clipboard`, `cliphist`
- Input Method:             `fcitx5`

## My Personal Scripts
- Status Bar:               [damblocks](./.local/bin/damblocks)
- Screenshot:               [shoot](./.local/bin/shoot)
- Screen Capture:           [capture](./.local/bin/capture)
- Webcam:                   [camera](./.local/bin/camera)
- Voice Recorder:           [record](./.local/bin/record)
- Brightness:               [bright](./.local/bin/bright)
- Speaker/Microphone Volume: [audio](./.local/bin/audio)
- Speaker Switch:           [speaker](./.local/bin/speaker)
- Bookmark:                 [address](./.local/bin/address)
- File Previewer:           [rifle](./.local/bin/scope)
- File Opener:              [scope](./.local/bin/rifle)
- {,un}{lock,mount} USB drives: [saddle](./.local/bin/saddle)
- GPG {en,de}crypt|preview|sign|verify: [seal](./.local/bin/seal)
- GPG Previewer:            [gpg-rifle](./.local/bin/gpg-rifle)
- Mutt/isync with Oauth2:   [muttauth](./.local/bin/muttauth)
- Newsboat Previewer:       [url-rifle](./.local/bin/url-rifle)
- Android Mounting:         [phone](./.local/bin/phone)
- Shortcuts Generator:      [teleport-genesis](./.local/bin/teleport-genesis)
- Qutebrowser:              [userscripts](./.local/bin/qutebrowser/)
- Xwayland Server/Client:   [xwl](./.local/bin/xwl)
- Reload other scripts:     [reload](./.local/bin/reload)

## Chinese Video Channel
I have dedicated videos for almost every software I use:

[unixchad at bilibili](https://space.bilibili.com/34569411)

Software I use to create videos:
- Screen Capture:   `wf-recorder`, `slurp`
- Voice Recording:  `pw-record`, `noise-suppression-for-voice`
- Video Editing:    `ffmpeg`, `mpv-cut`, `kdenlive`
- Screenshots:      `grim`, `slurp`
- Thumbnails:       `imagemagick`, `gimp`

All emails from me will be signed by the same GPG key that I sign commits with:
- Import my key: `gpg --recv-keys 117094DA1AEA0835E4ED0770F7476912AA224CAC`
- Download or copy at [here](./unixchad.asc)
- Always encrypt your emails with my public key if you know how to.

## License
I am the author of every file with the following disclaimer:
```sh
# @author nate zhou
```
I license them under the [GNU GPL-3.0](./LICENSE). There is no warranty, to
the extend permitted by applicable law.

A few scripts or config files come from others, and a credit to the respective
authors should be spotted.
