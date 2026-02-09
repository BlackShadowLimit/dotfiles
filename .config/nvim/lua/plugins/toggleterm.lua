return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup{
			size = 20,
			open_mapping = [[<F7>]],
			hide_numbers = true,
			shading_factor = 2,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {
				border = "curved",
				width = function()
					return math.floor(vim.opt.columns:get() * 0.8)
				end,
				height = function()
					return math.floor(vim.opt.lines:get() * 0.8)
				end,
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
				zindex = 100,
				title_pos = "center",
			},
			-- 使用 vim.loop.cwd() 來處理目錄，解決目錄異常導致的錯誤
			dir = function()
				return vim.loop.cwd()
			end,
			on_create = function(term)
				local opts = {buffer = term.bufnr}
				vim.keymap.set("t", "<F7>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
				vim.keymap.set("t", "<C-q>", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
				vim.api.nvim_buf_set_option(term.bufnr, "buflisted", false)
				vim.api.nvim_buf_set_option(term.bufnr, "filetype", "toggleterm")
			end,
			persist_size = true,
			insert_mappings = true,
			terminal_mappings = true,
			start_in_insert = true,
		}

		local function set_terminal_keymaps()
			local opts = {noremap = true, silent = true}
			vim.keymap.set("n", "<F7>", "<cmd>ToggleTerm<CR>", opts)
			vim.keymap.set("i", "<F7>", "<cmd>ToggleTerm<CR>", opts)
			vim.keymap.set("v", "<F7>", "<cmd>ToggleTerm<CR>", opts)
		end

		set_terminal_keymaps()

		local Terminal = require('toggleterm.terminal').Terminal

		local horizontal_term = Terminal:new({
			direction = "horizontal",
			size = 15,
		})

		local vertical_term = Terminal:new({
			direction = "vertical",
			size = function()
				return vim.opt.columns:get() * 0.3
			end,
		})

		vim.keymap.set("n", "<leader>th", function() horizontal_term:toggle() end, {desc = "Toggle horizontal terminal"})
		vim.keymap.set("n", "<leader>tv", function() vertical_term:toggle() end, {desc = "Toggle vertical terminal"})
	end
}
