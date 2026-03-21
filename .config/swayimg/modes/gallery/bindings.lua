-- swayimg/modes/gallery/bindings.lua
-- @author nate zhou
-- @since 2026

swayimg.gallery.bind_reset()

local functions = require("modes/gallery/functions")

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

swayimg.gallery.on_key("q", function()
    swayimg.exit(0)
end)
swayimg.gallery.on_key("escape", function()
    swayimg.exit(0)
end)
swayimg.gallery.on_key("return", function()
    swayimg.set_mode("viewer")
end)
swayimg.gallery.on_key("s", function()
    swayimg.set_mode("slideshow")
end)
swayimg.gallery.on_key("m", toggle_text)
swayimg.gallery.on_key("f", function()
    swayimg.toggle_fullscreen()
end)
swayimg.gallery.on_key("g", function()
    swayimg.gallery.switch_image("first")
end)
swayimg.gallery.on_key("Shift+g", function()
    swayimg.gallery.switch_image("last")
end)
swayimg.gallery.on_key("h", function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("Left", function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("j", function()
    swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("Down", function()
    swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("k", function()
    swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("Up", function()
    swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("l", function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_key("Right", function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_key("i", function()
    local current_size = swayimg.gallery.get_thumb_size()
    swayimg.gallery.set_thumb_size(current_size + 20)
end)
swayimg.gallery.on_key("o", function()
    local current_size = swayimg.gallery.get_thumb_size()
    swayimg.gallery.set_thumb_size(current_size - 20)
end)
swayimg.gallery.on_key("n", function()
    swayimg.gallery.switch_image("pgdown")
end)
swayimg.gallery.on_key("p", function()
    swayimg.gallery.switch_image("pgup")
end)
swayimg.gallery.on_key("z", function()
    swayimg.gallery.set_thumb_size(200)
end)
swayimg.gallery.on_key("a", toggle_antialiasing)

swayimg.gallery.on_key("Shift+d", functions.delete)
swayimg.gallery.on_key("Shift+s", functions.qrscan)
swayimg.gallery.on_key("Shift+w", functions.setwall)
swayimg.gallery.on_key("Shift+i", functions.invert)
