# vim:ft=python
# qutebrowser/config.py
# @author nate zhou
# @since 2025

c.zoom.default = 133

config.source('proxy.py')
config.source('colors.py')
config.source('bindings.py')

config.load_autoconfig(False) # ignore GUI settings

c.editor.command = ['footclient', '-T', 'Floating_Term', '-o', 'colors.alpha=0.9', 'nvim', '{file}', '-c', 'normal {line}G{column0}l']

# lf as file chooser
fileChooser = ['footclient', '-T', 'Floating_Term', '-o', 'colors.alpha=0.9', 'lf', '-selection-path={}']
c.fileselect.handler = "external"
c.fileselect.folder.command = fileChooser
c.fileselect.multiple_files.command = fileChooser
c.fileselect.single_file.command = fileChooser

c.url.start_pages = 'file:///dev/null'
c.url.default_page= 'file:///dev/null'
c.tabs.last_close = "startpage"
c.auto_save.session = True

c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]

c.fonts.web.size.default = 20 # webpage
c.fonts.default_size = '14pt' # UI
c.fonts.hints = 'normal 14pt SourceCodePro'

c.tabs.show = "always"
c.tabs.position = "left"
c.tabs.padding = {"bottom":0, "left":0, "right":0, "top":0}
c.tabs.indicator.width = 0
c.tabs.width = '10%'
c.statusbar.show = "always"

c.keyhint.delay = 0
c.hints.uppercase = True
c.hints.chars = "asdfjkl;"

c.downloads.location.directory = "~/dls"
c.downloads.location.prompt = False
c.downloads.location.suggestion = 'both'
c.downloads.location.remember = False
c.downloads.remove_finished = 3300
c.downloads.position = "bottom"

c.content.fullscreen.window = True # Limit fullscreen to browser window
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = [
  "https://easylist.to/easylist/easylist.txt",
  "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
  "https://easylist.to/easylist/easyprivacy.txt",
  "https://secure.fanboy.co.nz/fanboy-annoyance.txt",]

# privacy
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.completion.open_categories = ['filesystem']
