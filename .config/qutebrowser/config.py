# vim:ft=python
# qutebrowser/config.py
# @author nate zhou
# @since 2025

c.zoom.default = 150

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

c.zoom.levels = ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "125%", "133%", "150%", "175%", "200%", "250%", "300%"]
c.fonts.web.size.default = 20 # webpage
c.fonts.default_size = '14pt' # UI

c.tabs.last_close = "startpage"

c.tabs.show = "always"
c.tabs.position = "left"
c.tabs.padding = {"bottom":0, "left":0, "right":0, "top":0}
c.tabs.indicator.width = 0
c.tabs.min_width = 0
c.statusbar.show = "always"

c.hints.uppercase = True
c.hints.chars = "asdfjkl;"

c.downloads.location.directory = "~/dls"
c.downloads.position = "bottom"

c.content.fullscreen.window = True # Limit fullscreen to browser window
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.method = 'both'

# privacy
c.content.canvas_reading = False
c.content.geolocation = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
c.completion.open_categories = ['filesystem']
