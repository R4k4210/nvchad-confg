return {
   ["windwp/nvim-ts-autotag"] = {
      ft = { "html", "javascriptreact", "typescriptreact", "tsx", "jsx" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   ["nvim-telescope/telescope-media-files.nvim"] = {
      after = "telescope.nvim",
      config = function()
         require("telescope").load_extension "media_files"
      end,
   },

   ["Pocco81/TrueZen.nvim"] = {
      cmd = {
         "TZAtaraxis",
         "TZMinimalist",
         "TZFocus",
      },
      config = function()
         require "custom.plugins.truezen"
      end,
   },

   ["tomlion/vim-solidity"] = {},

   ["tpope/vim-fugitive"] = {},

   ["prettier/vim-prettier"] = {
     config = function()
        require "custom.plugins.prettier"
     end
   },

   ["matze/vim-move"] = {
     config = function()
        require "custom.plugins.vim-move"
     end
   },

   ["neovim/nvim-lspconfig"] = {
     config = function()
       require "custom.plugins.lspconfig"
     end,
   },

   ["github/copilot.vim"] = {
    config = function()
      require "custom.plugins.copilot"
    end
   }
}
