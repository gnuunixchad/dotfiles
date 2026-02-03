# <img src="./misc/dot-repo.png" width="24"/> dotfiles
<img src="./misc/kwm.png" width="1920"/>

[kwm on river](./misc/kwm.png) | [river-classic](./misc/river-classic.png) | [dwl](./misc/dwl.png) | [sway](./misc/sway.png)

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
> - Software complied from source, e.g. my build of
>   + `kwm`([codeberg](https://codeberg.org/unixchad/kwm)/[github](https://github.com/gnuunixchad/kwm))
>   + `river-classic`([codeberg](https://codeberg.org/unixchad/river-classic)/[github](https://github.com/gnuunixchad/river-classic))
>   + `dam`([codeberg](https://codeberg.org/unixchad/dam)/[github](https://github.com/gnuunixchad/dam))
>   + `dwl`([codeberg](https://codeberg.org/unixchad/dwl)/[github](https://github.com/gnuunixchad/dwl)).
>   + `dvtm`([codeberg](https://codeberg.org/unixchad/dvtm)/[github](https://github.com/gnuunixchad/dvtm))

## Software I Use
I prefer software that are free as in freedom, keyboard centric, terminal based,
vim like, do one thing and do it well. And try to avoid proprietary garbage and
spyware when I can.
| | |
|:---|:---|
| scripting shell | dash |
| login shell | zsh |
| terminal multiplexer| abduco dvtm |
| terminal emulator | foot |
| audio server | pipewire |
| wayland compositor | river river-classic dwl sway|
| river window manager | kwm |
| river-classic bar | dam |
| status generator | damblocks([codeberg](https://codeberg.org/unixchad/damblocks)/[github](https://github.com/gnuunixchad/damblocks))|
| output management | wlr-randr kanshi |
| application launcher | wmenu |
| fuzzy finder | fzf |
| notification daemon | dunst |
| editor | neovim vim |
| email | neomutt isync |
| file manager | lf |
| music player | mpd ncmpcpp |
| video player | mpv |
| image viewer | swayimg |
| ebook reader | zathura |
| rss feeder | newsboat |
| calender & todo | calcurse taskwarrior |
| virtualization | qemu libvirt virtmanager |
| security | cryptsetup  sbctl gpg firejail |
| browser | w3m qutebrowser |
| download | curl wget transmission-cli yt-dlp httrack |
| file sharing | rsync samba android-file-transfer qrtool |
| dotfiles manager | git stow |
| idle manager | swayidle |
| session lock | swaylock |
| clipboard | wl-clipboard  cliphist |
| input method | fcitx5 |

## My Personal Scripts
| | |
|:---|:---|
| status bar | [damblocks](./.local/bin/damblocks) |
| weather report | [wttr](./.local/bin/wttr) |
| screenshot | [shoot](./.local/bin/shoot) |
| screen capture | [capture](./.local/bin/capture) |
| webcam | [camera](./.local/bin/camera) |
| voice recorder | [record](./.local/bin/record) |
| brightness | [bright](./.local/bin/bright) |
| audio volume | [audio](./.local/bin/audio) |
| audio sink | [speaker](./.local/bin/speaker) |
| bookmark | [address](./.local/bin/address) |
| file previewer | [rifle](./.local/bin/scope) [gpg-rifle](./.local/bin/gpg-rifle) [url-rifle](./.local/bin/url-rifle) |
| file opener | [scope](./.local/bin/rifle) |
| mounting | [saddle](./.local/bin/saddle) [phone](./.local/bin/phone) |
| gpg | [seal](./.local/bin/seal) |
| mutt_oauth2 | [muttauth](./.local/bin/muttauth) |
| shortcuts generator | [teleport-genesis](./.local/bin/teleport-genesis) |
| qutebrowser | [userscripts](./.local/bin/qutebrowser/) |
| xwayland-satellite | [xwl](./.local/bin/xwl) |
| reload other scripts | [reload](./.local/bin/reload) |

## Chinese Video Channel
I have dedicated videos for almost every software I use:

[unixchad at bilibili](https://space.bilibili.com/34569411)

Software I use to create videos:
| | |
|:---|:---|
| screen capture | wf-recorder slurp |
| voice recording | pw-record noise-suppression-for-voice |
| video editing | ffmpeg mpv-cut kdenlive |
| screenshots | grim slurp |
| thumbnails | imagemagick gimp |

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
