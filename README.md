# sylt.nvim

A neovim plugin for [sylt-lang](https://github.com/sylt-lang/sylt-lang). This
includes a filetype and a tree-sitter parser with queries for highlights,
indents, injections and locals. This plugin is still a work in progress!


## Installation

Installation should be simple. Below is an example using lazy.nvim.

### lazy.nvim

```lua
{
   'Quaqqer/sylt.nvim',
   dependencies = 'nvim-treesitter/nvim-treesitter',
   config = true,
   build = function()
      require('sylt').setup_treesitter()
      vim.cmd("TSInstall! sylt")
   end,
}
```
