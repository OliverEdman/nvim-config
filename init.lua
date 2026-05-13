
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)


vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true


require("lazy").setup({

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
    end,
  },


  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('lualine').setup() end
  },

 
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 30, side = "left" },
      })
    end,
  },
})

vim.keymap.set('n', 'n', function()
  local nvimtree = require("nvim-tree.api")
  nvimtree.tree.toggle()
end, { desc = "Toggle NvimTree" })
