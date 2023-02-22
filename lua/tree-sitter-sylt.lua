return {
	setup = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.sylt = {
			install_info = {
				url = "git@github.com:Quaqqer/nvim-treesitter-sylt",
				files = { "src/parser.c" },
			},
			filetype = "sylt",
		}
	end,
}
