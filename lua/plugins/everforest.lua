return {
  "neanias/everforest-nvim",
  priority = 1000,
  config = function()
    require("everforest").setup({
      background = "hard",
    })
    vim.cmd("colorscheme everforest")
  end,
}
