local status_ok, neo_tree = pcall(require, "neo-tree")
if not status_ok then
  return
end

-- Drucula theme
-- https://github.com/Mofiqul/dracula.nvim/pull/55
vim.cmd[[highlight NeoTreeNormal guifg=#F8F8F2 guibg=#282A36]]
vim.cmd[[highlight NeoTreeNormalNC guifg=#F8F8F2 guibg=#282A36]]
vim.cmd[[highlight NeoTreeDirectoryName guifg=#F8F8F2]]
vim.cmd[[highlight NeoTreeGitUnstaged guifg=#FF92DF]] -- bright pink
vim.cmd[[highlight NeoTreeGitModified guifg=#FF92DF]] -- bright pink
vim.cmd[[highlight NeoTreeGitUntracked guifg=#69FF94]] -- bright green
vim.cmd[[highlight NeoTreeDirectoryIcon guifg=#BD93F9]] -- purple
vim.cmd[[highlight NeoTreeIndentMarker guifg=#3B4048]] -- nontext
vim.cmd[[highlight NeoTreeDotfile guifg=#6272A4]] -- comment

neo_tree.setup {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  use_popups_for_input = false,
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "",
    },
    modified = {
      symbol = "+",
      highlight = "NeoTreeGitUntracked",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "U",
        ignored   = "",
        unstaged  = "M",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    mappings = {
      ["l"] = "open",
      ["h"] = "close_node",
      ["a"] = { "add", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
      ["A"] = { "add_directory", config = { show_path = "relative" }}, -- "none", "relative", "absolute" 
      ["c"] = { "copy", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
      ["m"] = { "move", config = { show_path = "relative" }}, -- "none", "relative", "absolute"
    }
  },
  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        "node_modules",
        ".git"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
  },
}
