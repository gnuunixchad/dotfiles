-- swayimg/init.lua
-- @author nate zhou
-- @since 2026

require('modes.viewer')
require('modes.gallery')
require('modes.slideshow')

swayimg.imagelist.set_order("none")

swayimg.text.set_timeout(0)
swayimg.text.hide()
swayimg.text.set_font("SourceCodePro")
swayimg.text.set_size(20)
swayimg.text.set_padding(2)
swayimg.text.set_foreground(0xffdddddd)
swayimg.text.set_shadow(0xff222222)
