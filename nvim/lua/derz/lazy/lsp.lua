-- Adapted from a combo of
-- https://lsp-zero.netlify.app/v3.x/blog/theprimeagens-config-from-2022.html
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "L3MON4D3/LuaSnip",
    "j-hui/fidget.nvim",
    "hrsh7th/cmp-nvim-lsp"
  },

  config = function()
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'ts_ls',
        'lua_ls',
        'ruff',
        'eslint', -- 1. Add this
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({
            capabilities = capabilities,
          })
        end,

        eslint = function()
          require('lspconfig').eslint.setup({
            capabilities = capabilities,
            root_dir = require('lspconfig').util.root_pattern(
              '.eslintrc.json',
              '.eslintrc.js',
              'package.json',
              '.git'
            ),
          })
        end,

        lua_ls = function()
          -- Your existing lua_ls config remains the same...
        end
      }
    })

    -- this is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require('luasnip.loaders.from_vscode').lazy_load()
  end
}
