-- swayimg/config/init.lua
-- @author nate zhou
-- @since 2026

swayimg.set_mode("viewer")
swayimg.imagelist.set_order("none")

swayimg.on_window_resize(function()
  local mode = swayimg.get_mode()
  if mode == "viewer" then
    swayimg.viewer.set_fix_scale("optimal")
  elseif mode == "slideshow" then
    swayimg.slideshow.set_fix_scale("optimal")
  end
end)
