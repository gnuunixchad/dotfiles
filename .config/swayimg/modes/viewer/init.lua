-- swayimg/modes/viewer/init.lua
-- @author nate zhou
-- @since 2026

require("modes/viewer/text")
require("modes/viewer/bindings")

swayimg.viewer.set_default_scale("optimal")

swayimg.viewer.set_window_background(0xff111111)
swayimg.viewer.set_image_background(0xff111111)

swayimg.viewer.set_mark_color(0xffffffff)
