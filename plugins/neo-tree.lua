return {
  "nvim-neo-tree/neo-tree.nvim",
  opts =
    {
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true, -- only works on Windows for hidden files/directories
        },
      },
    }
}
