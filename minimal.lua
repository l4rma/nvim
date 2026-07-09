-- ~/.config/nvim/minimal.lua

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "m00qek/baleia.nvim",
    config = function()
      local baleia = require("baleia").setup({})
      vim.api.nvim_create_autocmd("BufReadPost", {
        callback = function()
          baleia.once(vim.api.nvim_get_current_buf())
        end,
      })
    end,
  },
})

-- Basic settings
vim.opt.number = false
vim.opt.swapfile = false
vim.opt.modifiable = false
vim.opt.wrap = false

-- Close with q
vim.keymap.set("n", " q", ":q!<CR>", { silent = true })
