-- swayimg/modes/viewer/text.lua
-- @author nate zhou
-- @since 2026

swayimg.viewer.set_text("topleft", {
  "{name}",
  "{format}",
  "{sizehr}",
  "{time}",
  "{meta.Exif.Photo.DateTimeOriginal}",
  "{meta.Exif.Image.Model}"
})
swayimg.viewer.set_text("topright", {
    "{list.index}/{list.total}"
})
swayimg.viewer.set_text("bottomleft", {
    "{frame.index}/{frame.total}",
    "{frame.width}x{frame.height}",
    "{scale}"
})
swayimg.viewer.set_text("bottomright", {
    "{path}"
})
