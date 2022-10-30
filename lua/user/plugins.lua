
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)

  -- https://github.com/SmiteshP/nvim-navic
  -- https://github.com/folke/trouble.nvim

  -- Neo-tree is a Neovim plugin to browse the file system and other tree like structures in whatever style suits you, including sidebars, floating windows, netrw split style, or all of them at once!
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "s1n7ax/nvim-window-picker",
    }
  }

  -- -- cmp plugins
  -- use { "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" } -- The completion plugin
  -- use { "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  -- use { "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" } -- path completions
  -- use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  -- use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  -- use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- -- snippets
  -- use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } --snippet engine
  -- use { "rafamadriz/friendly-snippets", commit = "d27a83a363e61009278b6598703a763ce9c8e617" } -- a bunch of snippets to use

  -- -- DAP
  -- use { "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" }
  -- use { "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" }
  -- use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- All the lua functions I don't want to write twice.
  -- https://github.com/nvim-lua/plenary.nvim
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins

  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  -- https://github.com/sindrets/diffview.nvim
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', commit = "a1fbcaa7e1e154cfa793ab44da4a6eb0ae15458d" }

  -- Use-package inspired plugin/package management for Neovim.
  -- https://github.com/wbthomason/packer.nvim
  use { "wbthomason/packer.nvim", commit = "50aeb9060cf64c3c27e6d7b11d7af9e209ed6c3b" } -- Have packer manage itself

  -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
  -- https://github.com/williamboman/mason.nvim
  use { "williamboman/mason.nvim", commit = "9a2f83f46cf498b3532afb05213dcc54de8d243a" }

  -- Surround selections, stylishly.
  -- https://github.com/kylechui/nvim-surround
  use { "kylechui/nvim-surround", tag = "v1.0.0" }

  -- A blazing fast and easy to configure Neovim statusline written in Lua.
  -- https://github.com/nvim-lualine/lualine.nvim
  use { "nvim-lualine/lualine.nvim", commit = "edca2b03c724f22bdc310eee1587b1523f31ec7c" }

  -- Speed up loading Lua modules in Neovim to improve startup time.
  -- https://github.com/lewis6991/impatient.nvim/tags
  use { "lewis6991/impatient.nvim", tag = "v0.2" }

  --  Colorschemes
  use { "Mofiqul/dracula.nvim", commit = "0b4f6e009867027caddc1f28a81d8a7da6a2b277" }
  -- use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }

  -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document.
  -- https://github.com/phaazon/hop.nvim/tags
  use { 'phaazon/hop.nvim', tag = 'v2.0.2' }

  -- Conquer of Completion
  -- https://github.com/neoclide/coc.nvim
  use { 'neoclide/coc.nvim', branch = "release" }

  -- An all in one neovim plugin written in lua that provides superior project management.
  -- https://github.com/ahmedkhalf/project.nvim
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }

  -- Buffer "taps"
  -- https://github.com/akinsho/bufferline.nvim
  use { "akinsho/bufferline.nvim", tag = "v2.11.1" }

  -- Cutlass overrides the delete operations to actually just delete and not affect the current yank.
  -- https://github.com/gbprod/cutlass.nvim
  use { "gbprod/cutlass.nvim", tag = "v1.0.0" }

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use { "nvim-telescope/telescope.nvim", tag = "0.1.0" }

  -- https://github.com/akinsho/toggleterm.nvim
  use { "akinsho/toggleterm.nvim", tag = "2.3.0" }
 
  -- It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
  -- https://github.com/mg979/vim-visual-multi/tags
  use { "mg979/vim-visual-multi", tag = 'v0.5.8' }

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  -- https://github.com/moll/vim-bbye
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }

  -- https://github.com/kyazdani42/nvim-tree.lua
  use { "kyazdani42/nvim-web-devicons" }

  -- Do easy block comment
  -- https://github.com/numToStr/Comment.nvim
  use { "numToStr/Comment.nvim", tag = 'v0.7.0' }
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }

  -- This plugin adds indentation guides to all lines (including empty lines).
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  use { "lukas-reineke/indent-blankline.nvim", tag = "v2.20.2" }

  -- Automatically highlighting of other uses of the word under the cursor
  -- https://github.com/RRethy/vim-illuminate
  use { "RRethy/vim-illuminate", commit = "0603e75fc4ecde1ee5a1b2fc8106ed6704f34d14" }

  -- Treesitter, Better syntax highlighting.
  -- https://github.com/nvim-treesitter/nvim-treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "8ec59aee8097c64fcf27d1dbd77ea181c50846c5" }

  -- Treesitter Rainbow, Making pair brackets same color.
  -- https://github.com/p00f/nvim-ts-rainbow
  use { "p00f/nvim-ts-rainbow", commit = "fad8badcd9baa4deb2cf2a5376ab412a1ba41797"}

  -- Git
  -- https://github.com/lewis6991/gitsigns.nvim
  use { "lewis6991/gitsigns.nvim", tag = "release", run = ":TSUpdate" }

  -- Helm Chart syntax highlighting
  -- https://github.com/towolf/vim-helm
  use { "towolf/vim-helm" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
