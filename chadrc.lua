local M = {}

local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"

M.plugins = {

   options = {
      statusline = {
         separator_style = "round",
      },
   },

   override = {
      ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["nvim-telescope/telescope.nvim"] = override.telescope,
      ["goolord/alpha-nvim"] = override.goolord,
      --["williamboman/mason"] = override.mason,
   },

   user = userPlugins,
}

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "gruvbox_light" },
}

M.mappings = require "custom.mappings"

return M
