## How Do I Setup Arch Linux?
[install.md](./install.md)

## What Is This Repository?
<img src="./misc/screenshot01.png" alt="drawing" width="480"/>
<img src="./misc/screenshot02.png" alt="drawing" width="480"/>

## How To Use This Repository?
```sh
# Clone this repository on codeberg
git clone https://codeberg.org/unixchad/dotfiles
# Or on github
git clone https://github.com/gnuunixchad/dotfiles
# Create symlinks with GNU Stow
cd dotfiles
stow -t ~ . --adopt
```
A few software need manually setup:
- Software whose config files named to `*.example` for privacy reasons
- Software whose config files located outside of the `$HOME`
- Software listed in `./.stow-local-ignore`

## Software I Use
- Distro:               Arch Linux
- Shell:                bash
- Window Manager:       sway
- Status bar:           i3blocks
- Terminal Emulator:    foot
- Editor:               neovim
- Email Client:         neomutt + isync
- File manager:         ranger
- Music player:         ncmpcpp
- Video player:         mpv Image Viewer:         swayimg
- Ebook Reader:         zathura
- Rss Feeder:           newsboat
- Calender:             calcurse
- Todo:                 taskwarrior

If you wanna konw more, dig into my [config files](./.config) and
[scripts](.local/bin), or check my videos if you speak Chinese:

## My Chinese Video Channel
[unixchad at bilibili](https://space.bilibili.com/34569411)

Software I use to create videos:
- Screen Capture:   wf-recorder + slurp
- Voice Recording:  pw-record + noise-suppression-for-voice
- Video Editing:    kdenlive + ffmpeg
- Screenshots:      grim + slurp
- Thumbnails:       gimp + imagemagick

I don't have time to read DMs on any social media other than email.  
All emails from me will be signed by the same GPG key that I sign commits with  
- Import my key: `gpg --recv-keys 117094DA1AEA0835E4ED0770F7476912AA224CAC`
- Download or copy at [here](./unixchad.asc)

## License
I am the author of every file with the following disclaimer:
```sh
# @author nate zhou
```
I license them under the [GNU GPL-3.0](./LICENSE). There is **no
warranty** for this project, to the extend permitted by any applicable law.

A few scripts or config files come from others, and a credit to the respective
authors should be found.
