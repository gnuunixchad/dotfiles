-- swayimg/modes/gallery/init.lua
-- @author nate zhou
-- @since 2026

require("modes/gallery/text")
require("modes/gallery/bindings")

swayimg.gallery.set_selected_scale(1.2)

swayimg.gallery.set_aspect("keep")

swayimg.gallery.set_thumb_size(200)
swayimg.gallery.set_border_size(1)
swayimg.gallery.set_border_color(0xffeeeeee)

swayimg.gallery.set_window_color(0xff111111)

swayimg.gallery.enable_preload(true)
