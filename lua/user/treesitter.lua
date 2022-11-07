local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
  ensure_installed = "all", -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
    disable = { "" }, -- list of language that will be disabled
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
})

-- Deps 
-- telescope: tree-sitter-cli
-- telescope: ripgrep
-- telescope: fd-find
