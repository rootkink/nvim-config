return {
	"numToStr/Comment.nvim",
	opts = {
		---Add a space b/w comment and the line
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,
		---Lines to be ignored while (un)comment
		ignore = nil,
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = "gcO",
			---Add comment on the line below
			below = "gco",
			---Add comment at the end of line
			eol = "gcA",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		---Function to call before (un)comment
		pre_hook = nil,
		---Function to call after (un)comment
		post_hook = nil, -- add any options here
	},
	vim.keymap.set("n", "<leader>/", function()
		require("Comment.api").toggle.linewise.current()
	end, { desc = "Toggle comment on current line" }),

	vim.keymap.set("v", "<leader>/", function()
		local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
		vim.api.nvim_feedkeys(esc, "x", false)
		require("Comment.api").toggle.linewise(vim.fn.visualmode())
	end, { desc = "Toggle comment on selection" }),

	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
