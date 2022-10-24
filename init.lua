-- Add modules here
local modules = {
  "user.options",
  "user.plugins",
  "user.theme",
  "user.gitsigns",
  "user.treesitter",
  "user.indentline",
  "user.keymappings",
  "user.comment",
  "user.nvim-tree",
  "user.bufferline",
  "user.vim-visual-multi",
  "user.toggleterm",
  "user.telescope",
  "user.project",
  "user.cutlass",
  "user.lualine",
  "user.impatient",
  "user.coc",
  "user.hop",
  "user.mason",
  "user.surround",
  "user.diffview",
}

-- Refresh module cache
for k, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end

