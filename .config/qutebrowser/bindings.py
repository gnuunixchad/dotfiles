# vim:ft=python
# @author nate zhou
# @since 2025
# source this file in config.py:
# config.source('bindings.py')

# unbind
config.unbind('<Ctrl-v>')
config.unbind('b')
config.unbind('m')
config.unbind('M')

# passthough mode
config.bind('<Ctrl-Shift-v>', 'mode-enter passthrough')

# normal mode
config.bind('cs', 'config-source')

config.bind('a', 'spawn ~/.local/bin/address --qutebrowser')
config.bind('<Shift-a>', 'spawn ~/.local/bin/address -Q')

config.bind('xd', 'spawn --userscript qute-dict')
config.bind('xq', 'spawn --userscript qute-code')
config.bind('xr', 'hint links userscript qute-rifle')
config.bind('xt', 'spawn --userscript qute-title')

config.bind('xa', 'spawn --userscript qute-address -a')
config.bind('xg', 'spawn --userscript qute-address -g')
config.bind('xD', 'spawn --userscript qute-address -d')
config.bind('xo', 'spawn --userscript qute-address -o')

config.bind('zi', 'zoom-in')
config.bind('zo', 'zoom-out')
config.bind('zz', 'zoom {}'.format(c.zoom.default))

# Set to False in `config.py`, manually toggle it if website's uploading breaks
config.bind('zcs', 'config-cycle content.canvas_reading True False')

config.bind('.', 'config-cycle tabs.show always never')
config.bind(',', 'config-cycle tabs.width 20% 10%')

config.bind('b', 'config-cycle statusbar.show always never')

config.bind('m', 'tab-mute')

config.bind(';s', 'hint images download')
config.bind('gp', 'open -p')

config.bind('j', 'scroll-px 0 120 ')
config.bind('k', 'scroll-px 0 -120 ')
config.bind('<Ctrl-u>', 'scroll page-up')
config.bind('<Ctrl-d>', 'scroll page-down')

config.bind('<Ctrl-Shift-p>', 'open -p')

config.bind('cd', 'download-clear')
config.bind('cm', 'clear-messages')
config.bind('ca', 'download-cancel')

config.bind('eu', 'edit-url')

config.bind('<Ctrl-j>', 'tab-move +')
config.bind('<Ctrl-k>', 'tab-move -')
config.bind('tg', 'tab-focus 1')
config.bind('tG', 'tab-focus -1')

config.bind('I', 'config-cycle colors.webpage.darkmode.enabled false true')

config.bind('<Shift-u>', 'adblock-update')

# insert mode
config.bind('<Ctrl-e>', 'edit-text', mode='insert')

# command mode
config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')
