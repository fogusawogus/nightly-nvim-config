vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("1.*") },
})

require("blink.cmp").setup({
	cmdline = { enabled = false },
	fuzzy = { implementation = "rust" },

	keymap = {
		preset = "default",
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
        ["<C-o>"] = {function(cmp) cmp.show() end}
	},
    snippets = {
        preset = 'luasnip'
    },

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
	signature = {
		enabled = false,
		window = {
			show_documentation = false,
		},
	},

	completion = {
		-- By default, you may press `<c-space>` to show the documentation.
		-- Optionally, set `auto_show = true` to show the documentation after a delay.
		documentation = { auto_show = false, auto_show_delay_ms = 500, window = { border = "rounded" } },
		menu = {
			auto_show = false,
			border = "none",
		},
		ghost_text = {
			enabled = true,
		},

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
	},
})
