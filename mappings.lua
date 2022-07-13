local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
   n = {
     ["<leader>wK"] = "",
     ["<leader>wk"] = "",
     ["K"] = "",
   }
}

M.general = {

   i = {

      -- go to  beginning and end
      ["<C-b>"] = { "<ESC>^i", "論 beginning of line" },
      ["<C-e>"] = { "<End>", "壟 end of line" },

      -- navigate within insert mode
      ["<M-h>"] = { "<Left>", "  move left" },
      ["<M-l>"] = { "<Right>", " move right" },
      ["<M-j>"] = { "<Down>", " move down" },
      ["<M-k>"] = { "<Up>", " move up" },
   },

   n = {

      -- switch between windows
      ["<C-h>"] = { "<C-w>h", " window left" },
      ["<C-l>"] = { "<C-w>l", " window right" },
      ["<C-j>"] = { "<C-w>j", " window down" },
      ["<C-k>"] = { "<C-w>k", " window up" },

      -- save
      ["<leader>w"] = { "<cmd> w <CR>", "﬚  save file" },

      -- Copy all
      ["<C-c>"] = { "<cmd> %y+ <CR>", "  copy whole file" },

      -- line numbers
      ["<leader>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
      ["<leader>rn"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },

      -- update nvchad
      ["<leader>uu"] = { "<cmd> :NvChadUpdate <CR>", "  update nvchad" },

      ["<leader>tt"] = {
         function()
            require("base46").toggle_theme()
         end,

         "   toggle theme",
      },

      -- vim fugitive
      ["<leader>gs"] = { "<cmd> :Git status <CR>", "☕ git status" },
      ["<leader>gb"] = { "<cmd> :Git blame <CR>", "☕ git blame" },
      ["<leader>gp"] = { "<cmd> :Git -c push.default=current push <CR>", "☕ git push" },
      ["<leader>ga"] = { "<cmd> :Git add . <CR>", "☕ git add all" },
      ["<leader>gc"] = { "<cmd> :Git commit <CR>", "☕ git commit" },
      ["<leader>gl"] = { "<cmd> :Git pull <CR>", "☕ git pull" },

      -- window split
      ["<leader>ws"] = { "<cmd> :split <CR>", " split window horizontal" },
      ["<leader>wv"] = { "<cmd> :vsplit <CR>", " split window vertical" },

      -- resize split pane
      ["<M-up>"] = { "<cmd> :resize -2 <CR>", " resize window up" },
      ["<M-down>"] = { "<cmd> :resize +2 <CR>", " resize window down" },
      ["<M-left>"] = { "<cmd> :vertical resize -2 <CR>", " resize window left" },
      ["<M-right>"] = { "<cmd> :vertical resize +2 <CR>", " resize window right" },

   },

   t = {
      ["jk"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
   },
}

M.tabufline = {

   n = {
      -- new buffer
      ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

      -- cycle through buffers
      ["<TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
      ["<S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

      -- cycle through tabs
      ["<leader>tp"] = { "<cmd> tabprevious <CR>", "  goto next tab" },
      ["<leader>tn"] = { "<cmd> tabnext <CR> ", "  goto prev tab" },

      -- close buffer + hide terminal buffer
      ["<leader>q"] = {
         function()
            require("core.utils").close_buffer()
         end,
         "   close buffer",
      },
   },
}

M.comment = {

   -- toggle comment in both modes
   n = {
      ["<leader>/"] = {
         function()
            require("Comment.api").toggle_current_linewise()
         end,

         "蘒  toggle comment",
      },
   },

   v = {
      ["<leader>/"] = {
         "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
         "蘒  toggle comment",
      },
   },
}

M.nvimtree = {

   n = {
      -- toggle
      ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },

      -- focus
      ["C-n"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
   },


}

M.nvterm = {
   t = {
      -- toggle in terminal mode
      ["<A-i>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },

      ["<A-h>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },

      ["<A-v>"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },
   },

   n = {
      -- toggle in normal mode
      ["<A-i>"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },

      ["<A-ho>"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },

      ["<A-v>"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },

      -- new

      ["<leader>h"] = {
         function()
            require("nvterm.terminal").new "horizontal"
         end,
         "   new horizontal term",
      },

      ["<leader>v"] = {
         function()
            require("nvterm.terminal").new "vertical"
         end,
         "   new vertical term",
      },
   },
}

M.lspconfig = {
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

   n = {
      ["gD"] = {
         function()
            vim.lsp.buf.declaration()
         end,
         "   lsp declaration",
      },

      ["gd"] = {
         function()
            vim.lsp.buf.definition()
         end,
         "   lsp definition",
      },

      ["HO"] = {
         function()
            vim.lsp.buf.hover()
         end,
         "   lsp hover",
      },

      ["gi"] = {
         function()
            vim.lsp.buf.implementation()
         end,
         "   lsp implementation",
      },

      ["<leader>ls"] = {
         function()
            vim.lsp.buf.signature_help()
         end,
         "   lsp signature_help",
      },

      ["<leader>D"] = {
         function()
            vim.lsp.buf.type_definition()
         end,
         "   lsp definition type",
      },

      ["<leader>ra"] = {
         function()
            require("nvchad.ui.renamer").open()
         end,
         "   lsp rename",
      },

      ["<leader>ca"] = {
         function()
            vim.lsp.buf.code_action()
         end,
         "   lsp code_action",
      },

      ["gr"] = {
         function()
            vim.lsp.buf.references()
         end,
         "   lsp references",
      },

      ["<leader>f"] = {
         function()
            vim.diagnostic.open_float()
         end,
         "   floating diagnostic",
      },

      ["[d"] = {
         function()
            vim.diagnostic.goto_prev()
         end,
         "   goto prev",
      },

      ["d]"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },

      ["<leader>qw"] = {
         function()
            vim.diagnostic.setloclist()
         end,
         "   diagnostic setloclist",
      },

      ["<leader>fm"] = {
         function()
            vim.lsp.buf.formatting()
         end,
         "   lsp formatting",
      },

      ["<leader>wa"] = {
         function()
            vim.lsp.buf.add_workspace_folder()
         end,
         "   add workspace folder",
      },

      ["<leader>wr"] = {
         function()
            vim.lsp.buf.remove_workspace_folder()
         end,
         "   remove workspace folder",
      },

      ["<leader>wl"] = {
         function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end,
         "   list workspace folders",
      },
   },
}

M.whichkey = {
   n = {
      ["<leader>K"] = {
         function()
            vim.cmd "WhichKey"
         end,
         "   which-key all keymaps",
      },
      ["<leader>k"] = {
         function()
            local input = vim.fn.input "WhichKey: "
            vim.cmd("WhichKey " .. input)
         end,
         "   which-key query lookup",
      },
   },
}

M.truzen = {
   n = {
      ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "   truzen ataraxis" },
      ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "   truzen minimal" },
      ["<leader>tf"] = { "<cmd> TZFocus <CR>", "   truzen focus" },
   },
}

M.telescope = {
   n = {
      ["<leader>fp"] = { "<cmd> Telescope media_files <CR>", "  find media" },
   },
}

return M
