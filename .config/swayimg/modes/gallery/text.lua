-- swayimg/modes/gallery/text.lua
-- @author nate zhou
-- @since 2026

swayimg.gallery.set_text("topleft", {
  "{name}",
  "{format}",
  "{sizehr}",
  "{time}",
})
swayimg.gallery.set_text("topright", {
    "{list.index}/{list.total}",
})
swayimg.gallery.set_text("bottomleft", {
})
swayimg.gallery.set_text("bottomright", {
    "{dir}"
})
