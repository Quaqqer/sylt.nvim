local M = {}

function M.setup_treesitter()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.sylt = {
		install_info = {
			url = "git@github.com:Quaqqer/nvim-treesitter-sylt",
			files = { "src/parser.c" },
		},
		filetype = "sylt",
	}
end

function M.add_filetype()
	vim.filetype.add({
		extension = {
			sy = "sylt",
		},
	})
end

function M.setup()
	M.setup_treesitter()
	M.add_filetype()
end