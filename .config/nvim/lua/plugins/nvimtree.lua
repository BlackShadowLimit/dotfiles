return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
			git = {
				enable = true,
			},
			sync_root_with_cwd = true,
			on_attach = function(bufnr)
				local api = require('nvim-tree.api')

				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set('n', '<C-n>', api.fs.create, { buffer = bufnr, noremap = true, silent = true, desc = "Create new file or directory" })
				vim.keymap.set('n', '<C-d>', api.fs.trash, { buffer = bufnr, noremap = true, silent = true, desc = "Delete to trash" })
				vim.keymap.set('n', '<C-r>', api.fs.rename, { buffer = bufnr, noremap = true, silent = true, desc = "Rename" })

				vim.keymap.set('n', 'H', '<C-w>h', { buffer = bufnr, noremap = true, silent = true, desc = "Window left" })
				vim.keymap.set('n', 'J', '<C-w>j', { buffer = bufnr, noremap = true, silent = true, desc = "Window down" })
				vim.keymap.set('n', 'K', '<C-w>k', { buffer = bufnr, noremap = true, silent = true, desc = "Window up" })
				vim.keymap.set('n', 'L', '<C-w>l', { buffer = bufnr, noremap = true, silent = true, desc = "Window right" })
			end,
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
					vim.schedule(function()
						require("telescope.builtin").find_files({
							attach_mappings = function(_, map)
								local function open_tree_and_select()
									local actions = require("telescope.actions")
									actions.select_default(_)
									require("nvim-tree.api").tree.open()
									vim.cmd("wincmd l")
								end

								map("i", "<CR>", open_tree_and_select)
								map("n", "<CR>", open_tree_and_select)
								return true
							end,
						})
					end)
				else
					require("nvim-tree.api").tree.open()
					vim.cmd("wincmd l")
				end
			end
		})

		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle file tree" })
	end,
}
