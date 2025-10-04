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
	},

	appearance = {
		-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- Adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",
	},
    signature = {
        enabled = true,
        window = {
            show_documentation = false
        },
    },

	completion = {
		-- By default, you may press `<c-space>` to show the documentation.
		-- Optionally, set `auto_show = true` to show the documentation after a delay.
		documentation = { auto_show = false, auto_show_delay_ms = 500, window = { border = "rounded" } },
		menu = {
			auto_show = true,
			border = "none",
		},
		ghost_text = {
			enabled = false,
		},

		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
	},
})
