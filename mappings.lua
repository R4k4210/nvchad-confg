local function termcodes(str)
   return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
   n = {
     ["<leader>wK"] = "",
     ["<leader>wk"] = "",
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

   },

   t = {
      ["jk"] = { termcodes "<C-\\><C-N>", "   escape terminal mode" },
   },
}

M.bufferline = {

   n = {
      -- new buffer
      ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

      -- cycle through buffers
      ["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "  cycle next buffer" },
      ["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "  cycle prev buffer" },

      -- close buffer + hide terminal buffer
      ["<leader>q"] = {
         function()
            nvchad.close_buffer()
         end,
         "   close buffer",
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
