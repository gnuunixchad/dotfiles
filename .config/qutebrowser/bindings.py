# vim:ft=python
# @author nate zhou
# @since 2025
# source this file in config.py:
# config.source('bindings.py')

# normal mode
config.bind('cs', 'config-source')

config.bind('zi', 'zoom-in')
config.bind('zo', 'zoom-out')
config.bind('zz', 'zoom {}'.format(c.zoom.default))

config.bind('zt', 'config-cycle tabs.show multiple never')
config.bind('zb', 'config-cycle statusbar.show always never')

config.bind('zm', 'tab-mute')

config.bind('si', 'hint images download')
config.bind('gp', 'open -p')

config.bind('j', 'scroll-px 0 120 ')
config.bind('k', 'scroll-px 0 -120 ')
config.bind('<Ctrl-u>', 'scroll page-up')
config.bind('<Ctrl-d>', 'scroll page-down')

config.bind('<Ctrl-Shift-p>', 'open -p')

# insert mode
config.bind('<Ctrl-e>', 'edit-text', mode='insert')

# command mode
config.bind('<Ctrl-p>', 'completion-item-focus --history prev', mode='command')
config.bind('<Ctrl-n>', 'completion-item-focus --history next', mode='command')

