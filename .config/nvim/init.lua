-- @author nate zhou
-- @since 2023,2024
-- codeberg.org/unixchad/dotfiles
-- github.com/gnuunixchad/dotfiles

-- Set colorscheme and basic settings
vim.cmd [[colorscheme unixchad]]
vim.cmd [[syntax on]]

-- General settings
vim.o.ignorecase = true           -- Case insensitive searching
vim.o.smartcase = true            -- Smart case sensitivity
vim.o.background = "dark"         -- Set background to dark
vim.o.hlsearch = false            -- Disable search highlighting
vim.o.colorcolumn = "80"          -- Highlight column 80
vim.o.expandtab = true            -- Expand tabs to spaces
vim.o.tabstop = 4                 -- Spaces per tab
vim.o.shiftwidth = 4              -- Spaces per indentation level
vim.o.smartindent = true          -- Enable smart indentation
vim.o.number = true               -- Show line numbers
vim.o.relativenumber = true       -- Show relative line numbers
vim.o.clipboard = "unnamedplus"   -- Use system clipboard
vim.o.cursorline = true           -- Highlight current line
vim.o.cursorcolumn = true         -- Highlight current column
vim.o.mouse = ""                  -- Disable mouse

-- Highlight trailing whitespace
vim.cmd [[match ExtraWhitespace /\s\+$/]]
vim.cmd [[highlight ExtraWhitespace ctermbg=gray guibg=gray]]

-- Leader key
vim.g.mapleader = " " -- Set space as leader key

-- Custom keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Toggle options
map("n", "<leader>s", ":set spell!<CR>", opts)          -- Toggle spell check
map("n", "<leader>w", ":set wrap!<CR>", opts)          -- Toggle text wrap
map("n", "<leader>f", ":FZF<CR>", opts)               -- Open FZF
map("n", "<leader>c", ":set cursorcolumn!<CR>", opts) -- Toggle cursor column
map("n", "<leader>h", ":set hlsearch!<CR>", opts)     -- Toggle search highlight

-- Tab navigation
map("n", "<leader>t", ":tabnew<CR>", opts) -- Open new tab
map("n", "<leader>p", ":tabprev<CR>", opts) -- Go to previous tab
map("n", "<leader>n", ":tabnext<CR>", opts) -- Go to next tab

-- Reload configuration
map("n", "<leader>.", ":source ~/.config/nvim/init.lua<CR>", opts)

-- Git commands
map("n", "<leader>g", ":G<CR>", opts)                  -- Open Git status
map("n", "<leader>dx", ":Gdiffsplit<CR>", opts)        -- Git diff split
map("n", "<leader>dv", ":Gvdiffsplit<CR>", opts)       -- Git vertical diff split

-- Splits
map("n", "<leader>x", ":split<CR>", opts)              -- Horizontal split
map("n", "<leader>v", ":vsplit<CR>", opts)             -- Vertical split

-- Split navigation with Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Split resizing with Ctrl + y/u/i/o
map("n", "<C-y>", ":vertical resize -2<CR>", opts)
map("n", "<C-u>", ":resize +2<CR>", opts)
map("n", "<C-i>", ":resize -2<CR>", opts)
map("n", "<C-o>", ":vertical resize +2<CR>", opts)

-- Indenting in visual mode
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- Autocommands
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.config/sway/config",
  command = "!swaymsg reload"
})

-- Plugins (using vim-plug)
vim.cmd [[
call plug#begin()
Plug 'tpope/vim-fugitive' " Git integration
Plug 'ap/vim-css-color'  " CSS color preview
call plug#end()
]]
