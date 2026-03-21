-- swayimg/modes/viewer/bindings.lua
-- @author nate zhou
-- @since 2026

swayimg.viewer.bind_reset()

local functions = require("modes/viewer/functions")

is_viewer_animation_running = true
local function toggle_viewer_animation()
    if is_viewer_animation_running then
        swayimg.viewer.animation_stop()
        is_viewer_animation_running = false
    else
        swayimg.viewer.animation_resume()
        is_viewer_animation_running = true
    end
end

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

swayimg.viewer.on_key("q", function()
    swayimg.exit(0)
end)
swayimg.viewer.on_key("escape", function()
    swayimg.exit(0)
end)
swayimg.viewer.on_key("Ctrl+n", function()
    swayimg.viewer.switch_image("next_dir")
end)
swayimg.viewer.on_key("Ctrl+p", function()
    swayimg.viewer.switch_image("prev_dir")
end)
swayimg.viewer.on_key("return", function()
    swayimg.set_mode("gallery")
end)
swayimg.viewer.on_key("s", function()
    is_slideshow_animation_running = true
    is_viewer_animation_running = true
    swayimg.set_mode("slideshow")
end)
swayimg.viewer.on_key("m", toggle_text)
swayimg.viewer.on_key("f", function()
    swayimg.toggle_fullscreen()
end)
swayimg.viewer.on_key("g", function()
    swayimg.viewer.switch_image("first")
end)
swayimg.viewer.on_key("Shift+g", function()
    swayimg.viewer.switch_image("last")
end)
swayimg.viewer.on_key("h", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("Left", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("j", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)
swayimg.viewer.on_key("Down", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end)
swayimg.viewer.on_key("k", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)
swayimg.viewer.on_key("Up", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end)
swayimg.viewer.on_key("l", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("Right", function()
    local wnd = swayimg.get_window_size()
    local pos = swayimg.viewer.get_position()
    swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end)
swayimg.viewer.on_key("i", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale + scale / 10
    swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)
swayimg.viewer.on_key("o", function()
    local pos = swayimg.get_mouse_pos()
    local scale = swayimg.viewer.get_scale()
    scale = scale - scale / 10
    swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end)
swayimg.viewer.on_key("n", function()
    swayimg.viewer.switch_image("next")
end)
swayimg.viewer.on_key("p", function()
    swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_key("z", function()
    swayimg.viewer.reset()
end)
swayimg.viewer.on_key("comma", function()
    swayimg.viewer.prev_frame()
end)
swayimg.viewer.on_key("period", function()
    swayimg.viewer.next_frame()
end)
swayimg.viewer.on_key("space", toggle_viewer_animation)
swayimg.viewer.on_key("Shift+r", function()
    swayimg.viewer.rotate(270)
end)
swayimg.viewer.on_key("r", function()
    swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key("Shift+v", function()
    swayimg.viewer.flip_horizontal()
end)
swayimg.viewer.on_key("v", function()
    swayimg.viewer.flip_vertical()
end)
swayimg.viewer.on_key("a", toggle_antialiasing)
swayimg.viewer.on_key("w", function()
    swayimg.viewer.set_fix_scale("width")
end)
swayimg.viewer.on_key("e", function()
    swayimg.viewer.set_fix_scale("height")
end)
swayimg.viewer.on_key("Shift+e", function()
    swayimg.viewer.set_fix_scale("fit")
end)
swayimg.viewer.on_key("Shift+f", function()
    swayimg.viewer.set_fix_scale("fill")
end)

swayimg.viewer.on_key("Shift+d", functions.delete)
swayimg.viewer.on_key("Shift+s", functions.qrscan)
swayimg.viewer.on_key("Shift+w", functions.setwall)
swayimg.viewer.on_key("Shift+i", functions.invert)
