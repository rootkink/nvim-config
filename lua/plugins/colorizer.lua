return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {

		filetypes = {
			"*", -- Enable for all filetypes by default
			css = { css = true },
			scss = { css = true },
			html = { names = true },
		},
		user_default_options = {
			RGB = true, -- #RGB
			RRGGBB = true, -- #RRGGBB
			names = false, -- "blue", "red", etc.
			RRGGBBAA = true, -- #RRGGBBAA
			AARRGGBB = false, -- 0xAARRGGBB
			rgb_fn = true, -- rgb() and rgba()
			hsl_fn = true, -- hsl() and hsla()
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, etc.
			mode = "background", -- "background" | "foreground" | "virtualtext"
		},
	},
	config = function(_, opts)
		require("colorizer").setup(opts)
		vim.cmd("ColorizerToggle")
	end,
}
