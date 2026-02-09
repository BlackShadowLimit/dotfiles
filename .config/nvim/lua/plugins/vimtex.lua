return {
    "lervag/vimtex",
    lazy = false,
    init = function()
		vim.g.vimtex_view_method = "sioyek"

		vim.g.vimtex_compiler_latexmk = {
            build_dir = "build",
        }
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_forward_search_on_start = true
    end,
}
