-- Window navigation with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set({ "n", "x" }, "=", function()
  require("conform").format({
    async = true,
    lsp_fallback = true,
  })
end)

-- Use a local variable to store the terminal instance
local lazygit = nil

function _lazygit_toggle()
  -- Make sure toggleterm.nvim is loaded first
  local Terminal = require("toggleterm.terminal").Terminal

  -- Create the terminal instance only if it doesn't exist
  if not lazygit then
    lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        -- No need for vim.cmd("startinsert!"), toggleterm does this
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      -- No need for an on_close, we control it with the toggle function
    })
  end
  
  -- Toggle the terminal
  lazygit:toggle()
end

