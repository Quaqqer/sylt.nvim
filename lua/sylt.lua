-- Stolen from https://www.reddit.com/r/neovim/comments/tk1hby/get_the_path_to_the_current_lua_script_in_neovim/
local function is_win()
	return package.config:sub(1, 1) == "\\"
end

local function get_path_separator()
	if is_win() then
		return "\\"
	end
	return "/"
end

local function script_path()
	local str = debug.getinfo(2, "S").source:sub(2)
	if is_win() then
		str = str:gsub("/", "\\")
	end
	return str:match("(.*" .. get_path_separator() .. ")")
end

local M = {
	_tree_sitter_setup = false,
}

function M.setup_treesitter()
	if not M._tree_sitter_setup then
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

		parser_config.sylt = {
			install_info = {
				url = script_path() .. "./../tree-sitter-sylt",
				files = { "src/parser.c" },
			},
			filetype = "sylt",
		}

		M._tree_sitter_setup = true
	end
end

function M.install_treesitter()
	M.setup_treesitter()
	vim.cmd("TSInstall! sylt")
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

return M
