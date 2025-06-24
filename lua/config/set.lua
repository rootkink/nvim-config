-- ╭────────────────────────────────────────────────────╮
-- │ General                                            │
-- ╰────────────────────────────────────────────────────╯
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.mouse = "a" -- Enable mouse support
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.swapfile = false -- Disable swap files
vim.o.undofile = true -- Persistent undo

vim.o.confirm = true -- Prompt to save on exit
vim.o.hidden = true -- Allow buffer switching without saving
vim.o.termguicolors = true -- True color support
vim.o.updatetime = 250 -- Faster completion

-- ╭────────────────────────────────────────────────────╮
-- │ UI                                                 │
-- ╰────────────────────────────────────────────────────╯
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.signcolumn = "yes" -- Always show signcolumn
vim.o.cursorline = true -- Highlight current line
vim.o.scrolloff = 10 -- Minimum lines above/below cursor
vim.o.showmode = false -- Don't show mode (handled by statusline)

vim.o.splitright = true -- Vertical splits to the right
vim.o.splitbelow = true -- Horizontal splits below

-- ╭────────────────────────────────────────────────────╮
-- │ Search                                             │
-- ╰────────────────────────────────────────────────────╯
vim.o.ignorecase = true -- Case-insensitive by default
vim.o.smartcase = true -- But case-sensitive if capital used
vim.o.incsearch = true -- Incremental search
vim.o.hlsearch = true -- Highlight search matches
vim.o.inccommand = "split" -- Live preview of :substitute

-- ╭────────────────────────────────────────────────────╮
-- │ Indentation & Tabs                                 │
-- ╰────────────────────────────────────────────────────╯
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 2 -- Number of spaces per tab
vim.o.shiftwidth = 2 -- Size of indent
vim.o.smartindent = true -- Smart autoindenting
vim.o.autoindent = true -- Maintain indent of current line

-- ╭────────────────────────────────────────────────────╮
-- │ Whitespace Characters                              │
-- ╰────────────────────────────────────────────────────╯
vim.o.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
	extends = "⟩",
	precedes = "⟨",
}

-- ╭────────────────────────────────────────────────────╮
-- │ Window Behavior                                    │
-- ╰────────────────────────────────────────────────────╯
vim.o.wrap = false -- Disable line wrap
vim.o.equalalways = false -- Don’t resize splits automatically

-- ╭────────────────────────────────────────────────────╮
-- │ File Handling                                      │
-- ╰────────────────────────────────────────────────────╯
vim.o.backspace = "indent,eol,start" -- Allow backspace in insert mode
vim.o.lazyredraw = true -- Don’t redraw while executing macros

-- ╭────────────────────────────────────────────────────╮
-- │ Completion                                         │
-- ╰────────────────────────────────────────────────────╯
vim.o.completeopt = "menuone,noselect" -- Better completion experience

-- ╭────────────────────────────────────────────────────╮
-- │ Performance                                        │
-- ╰────────────────────────────────────────────────────╯
vim.o.timeoutlen = 400 -- Shorter timeout for mapped sequences

-- ╭────────────────────────────────────────────────────╮
-- │ Diagnostics (signs)                                │
-- ╰────────────────────────────────────────────────────╯
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
