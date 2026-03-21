-- swayimg/modes/slideshow/text.lua
-- @author nate zhou
-- @since 2026

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
