local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true           -- Visa radnummer
vim.opt.relativenumber = true   -- Relativa nummer (bra för snabb navigation)
vim.opt.termguicolors = true    -- Krävs för snygga teman
vim.opt.cursorline = true       -- Markera raden du står på

require("lazy").setup({  -- Start på plugin-listan
  { 
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
    end,
  },
  
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },
}) 
