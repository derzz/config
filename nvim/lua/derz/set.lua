vim.cmd.colorscheme("tokyonight")

vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers

-- set tab size to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.incsearch = true -- incremental search

vim.opt.termguicolors = true

vim.opt.termguicolors = true
require("bufferline").setup()
require("toggleterm").setup()
require("oil").setup()
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    -- Add this block for JSX and TSX files
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
  },
})
