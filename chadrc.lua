local M = {}

local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },

      statusline = {
         separator_style = "round",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["nvim-telescope/telescope.nvim"] = override.telescope,
      ["goolord/alpha-nvim"] = override.goolord,
   },

   user = userPlugins,
}

M.ui = {
  theme = "gruvchad",
  -- theme_toggle = { "onedark", "one_light" },
}

M.mappings = require "custom.mappings"

return M
