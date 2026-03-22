-- swayimg/config/init.lua
-- @author nate zhou
-- @since 2026

swayimg.set_mode("viewer")
swayimg.imagelist.set_order("none")

swayimg.on_window_resize(function()
  swayimg.viewer.set_fix_scale("optimal")
end)
