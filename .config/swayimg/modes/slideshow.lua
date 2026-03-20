-- swayimg/modes/slideshow.lua
-- @author nate zhou
-- @since 2026

swayimg.slideshow.bind_reset()

swayimg.slideshow.set_text("topleft", {
  "{name}",
  "{format}",
  "{sizehr}",
  "{time}",
  "{meta.Exif.Photo.DateTimeOriginal}",
  "{meta.Exif.Image.Model}"
})
swayimg.slideshow.set_text("topright", {
    "{list.index}/{list.total}",
})
swayimg.slideshow.set_text("bottomleft", {
    "{frame.index}/{frame.total}",
    "{frame.width}x{frame.height}",
    "{scale}"
})
swayimg.slideshow.set_text("bottomright", {
    "{path}"
})

swayimg.slideshow.on_key("q", function()
    swayimg.exit(0)
end)

local is_antialiasing = true
local function toggle_antialiasing()
    if is_antialiasing then
        swayimg.enable_antialiasing(false)
        is_antialiasing = false
    else
        swayimg.enable_antialiasing(true)
        is_antialiasing = true
    end
end

local function toggle_text()
    if swayimg.text.visible() then
        swayimg.text.hide()
    else
        swayimg.text.show()
    end
end

for n = 1, 9 do
    swayimg.slideshow.on_key(tostring(n), function()
        swayimg.slideshow.set_timeout(n)
    end)
end

swayimg.slideshow.on_key("q", function()
    swayimg.exit(0)
end)
swayimg.slideshow.on_key("escape", function()
    swayimg.exit(0)
end)
swayimg.slideshow.on_key("Ctrl+n", function()
    swayimg.slideshow.switch_image("next_dir")
end)
swayimg.slideshow.on_key("Ctrl+p", function()
    swayimg.slideshow.switch_image("prev_dir")
end)
swayimg.slideshow.on_key("return", function()
    swayimg.set_mode("gallery")
end)
swayimg.slideshow.on_key("s", function()
    swayimg.set_mode("viewer")
end)
swayimg.slideshow.on_key("m", toggle_text)
swayimg.slideshow.on_key("f", function()
    swayimg.toggle_fullscreen()
end)
swayimg.slideshow.on_key("g", function()
    swayimg.slideshow.switch_image("first")
end)
swayimg.slideshow.on_key("Shift+g", function()
    swayimg.slideshow.switch_image("last")
end)
swayimg.slideshow.on_key("h", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)
swayimg.slideshow.on_key("Left", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)
swayimg.slideshow.on_key("j", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)
swayimg.slideshow.on_key("Down", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)
swayimg.slideshow.on_key("k", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)
swayimg.slideshow.on_key("Up", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)
swayimg.slideshow.on_key("l", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
swayimg.slideshow.on_key("Right", function()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.slideshow.get_position()
  swayimg.slideshow.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
swayimg.slideshow.on_key("i", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.slideshow.get_scale()
    scale = scale + scale / 10
    swayimg.slideshow.set_abs_scale(scale, pos.x, pos.y);
end)
swayimg.slideshow.on_key("o", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.slideshow.get_scale()
    scale = scale - scale / 10
    swayimg.slideshow.set_abs_scale(scale, pos.x, pos.y);
end)
swayimg.slideshow.on_key("n", function()
    swayimg.slideshow.switch_image("next")
end)
swayimg.slideshow.on_key("p", function()
    swayimg.slideshow.switch_image("prev")
end)
swayimg.slideshow.on_key("z", function()
    swayimg.slideshow.reset()
end)
swayimg.slideshow.on_key("comma", function()
    swayimg.slideshow.prev_frame()
end)
swayimg.slideshow.on_key("period", function()
    swayimg.slideshow.next_frame()
end)
swayimg.slideshow.on_key("space", toggle_animation)
swayimg.slideshow.on_key("Shift+r", function()
    swayimg.slideshow.rotate(270)
end)
swayimg.slideshow.on_key("r", function()
    swayimg.slideshow.rotate(90)
end)
swayimg.slideshow.on_key("Shift+v", function()
    swayimg.slideshow.flip_horizontal()
end)
swayimg.slideshow.on_key("v", function()
    swayimg.slideshow.flip_vertical()
end)
swayimg.slideshow.on_key("a", toggle_antialiasing)
