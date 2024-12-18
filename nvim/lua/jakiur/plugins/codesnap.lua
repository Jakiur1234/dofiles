return {
  "mistricky/codesnap.nvim",
  build = "make",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Desktop/CodeSnap/",
    has_breadcrumbs = false,
    bg_theme = "dusk",
    has_line_numbers = false,
    code_font_family = "FiraCode Nerd Font Mono",
    watermark = "by jakiur",
  },
}
