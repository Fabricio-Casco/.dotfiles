local ok, explorer = pcall(require, 'nvim-tree')

if not ok then
  return
end

explorer.setup {
  disable_netrw        = false,
  hijack_netrw         = false,
  open_on_setup        = false,
  hijack_cursor        = true,
  view = {
    width = 45,
    hide_root_folder = true,
    side = 'left',
    preserve_window_proportions = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = true,
    relativenumber = true,
    signcolumn = "yes"
  },
  filters = {
    dotfiles = false,
    custom = {
      ".git",
      "node_modules",
      ".cache",
      "__pycache__",
    },
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
}
