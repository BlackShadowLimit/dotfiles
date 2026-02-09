return {
	"folke/noice.nvim",
	config = function()
		require("noice").setup({
			routes = {
				{
					filter = {
						event = 'msg_show',
						any = {
							{ find = '%d+L, %d+B' },
							{ find = '; after #%d+' },
							{ find = '; before #%d+' },
							{ find = '%d fewer lines' },
							{ find = '%d more lines' },
						},
					},
					opts = { skip = true },
				}
			},
			presets = {
				command_palette = true,
			},
		})

		require("telescope").load_extension("ui-select")
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	}
}
