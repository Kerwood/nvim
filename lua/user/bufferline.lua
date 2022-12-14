local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end
vim.opt.termguicolors = true
bufferline.setup {
  options = {
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    offsets = { { filetype = "neo-tree", text = "" } },
    separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
    tab_size = 25,
  },
}
