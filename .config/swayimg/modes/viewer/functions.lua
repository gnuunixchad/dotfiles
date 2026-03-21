-- swayimg/modes/viewer/functions.lua
-- @author nate zhou
-- @since 2026

local M = {}

function M.delete()
    local image = swayimg.viewer.get_image()
    if not image or not image.path then return end

    local reply = os.tmpname()

    os.execute(string.format("printf 'no\nyes' | wmenu-color -p '[swayimg] Delete image?' > %s", reply))

    local f = io.open(reply, "r")
    local choice = f and f:read("*all"):gsub("\n$", "") or ""
    if f then f:close() end
    os.remove(reply)

    if choice == "yes" then
        os.remove(image.path)
        os.execute("pkill -SIGUSR1 swayimg")
        os.execute(string.format("notify-send -t 1100 -u low -r 3301 'swayimg' 'Deleted %s'", image.path))
    end
end

function M.qrscan()
    local image = swayimg.viewer.get_image()
    if not image or not image.path then return end

    local escaped_path = "'" .. image.path:gsub("'", "'\\''") .. "'"
    local cmd = string.format("qrtool decode %s | wl-copy", escaped_path)
    os.execute(cmd)
    os.execute(string.format("notify-send -t 1100 -u low -r 3301 'swayimg' 'QR code copied to clipboard'"))
end

function M.setwall()
    local image = swayimg.viewer.get_image()
    if not image or not image.path then return end

    local escaped_path = "'" .. image.path:gsub("'", "'\\''") .. "'"
    local filename = image.path:match("([^/]+)$") or image.path

    os.execute(string.format("~/.local/bin/setwall %s", escaped_path))
    os.execute(string.format("notify-send -r 107 -u low 'swayimg' '%s has been set as wallpaper'", filename))
end

function M.invert()
    local image = swayimg.viewer.get_image()
    if not image or not image.path then return end

    local escaped_path = "'" .. image.path:gsub("'", "'\\''") .. "'"
    local cmd = string.format("convert %s -channel RGB -negate - | swayimg -", escaped_path)
    os.execute(cmd)
end

return M
