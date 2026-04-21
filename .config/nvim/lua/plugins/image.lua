-- vim:ft=lua
-- nvim/lua/plugins/image.lua
-- @author nate zhou
-- @since 2026

require("image").setup({
  backend = "sixel",
  processor = "magick_cli",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = true,
      download_remote_images = true,
      only_render_image_at_cursor = true,
      only_render_image_at_cursor_mode = "popup",
    },
    html = {
      enabled = true,
      clear_in_insert_mode = true,
      download_remote_images = true,
      only_render_image_at_cursor = true,
      only_render_image_at_cursor_mode = "popup",
    },
    css = {
      enabled = true,
      clear_in_insert_mode = true,
      download_remote_images = true,
      only_render_image_at_cursor = true,
      only_render_image_at_cursor_mode = "popup",
    },
  },
})
