return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")

    -- Setup
    wk.setup({
      plugins = {
        marks = false,
        registers = false,
        spelling = { enabled = true, suggestions = 20 },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = false,
          g = false,
        },
      },
      icons = { breadcrumb = "»", separator = "➜", group = "+" },
      keys = { scroll_down = "<c-d>", scroll_up = "<c-u>" },
      layout = { height = { 4, 25 }, width = { 20, 50 }, spacing = 3, align = "left" },
      show_help = true,
      show_keys = true,
      triggers = { "<leader>" },
      disable = { buftypes = {}, filetypes = { "TelescopePrompt" } },
    })

    -- Visual mode mappings
    wk.add({
      { "<leader>g",  group = "Git" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",           desc = "Reset Hunk" },
      { "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",           desc = "Stage Hunk" },
      { "<leader>l",  group = "LSP" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    }, { mode = "v" })

    -- Normal mode mappings
    wk.add({
      { "<leader>;",  "<cmd>Alpha<CR>", desc = "Dashboard" },
      { "<leader>T",  group = "Treesitter" },
      { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info" },

      -- Buffers
      { "<leader>b",  group = "Buffers" },
      { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by dir" },
      { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by lang" },
      { "<leader>bW", "<cmd>noautocmd w<cr>", desc = "Save w/o formatting" },
      { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
      { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick buffer to close" },
      { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find buffer" },
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all left" },
      { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all right" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
      { "<leader>c",  "<cmd>bd<CR>", desc = "Close Buffer" },

      -- Files
      { "<leader>e",  "<cmd>NvimTreeToggle<CR>", desc = "Explorer" },
      { "<leader>f", group = "Find" },
      { "<leader>ff", function() require("telescope.builtin").find_files { previewer = false } end, desc = "Find File" },
      { "<leader>fg", function() require("telescope.builtin").live_grep { previewer = false } end, desc = "Live Grep" },

      -- Git
      {"<leader>g", "<cmd>lua _lazygit_toggle()<CR>",desc = "Git" },

      -- LSP
      { "<leader>l",  group = "LSP" },
      { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
      { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens" },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

      -- Plugins
      { "<leader>L",  group = "Lazy" },
      { "<leader>LS", "<cmd>Lazy clear<cr>", desc = "Status" },
      { "<leader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean" },
      { "<leader>Ld", "<cmd>Lazy debug<cr>", desc = "Debug" },
      { "<leader>Li", "<cmd>Lazy install<cr>", desc = "Install" },
      { "<leader>Ll", "<cmd>Lazy log<cr>", desc = "Log" },
      { "<leader>Lp", "<cmd>Lazy profile<cr>", desc = "Profile" },
      { "<leader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync" },
      { "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },

      -- Session (new group to avoid key conflict)
      { "<leader>q", group = "Sessions" },
      { "<leader>qs", function() require("persistence").load() end, desc = "Load Session" },
      { "<leader>qS", function() require("persistence").select() end, desc = "Select Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Load Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Stop Persistence" },
      
      -- Window / Splits
      { "<leader>w",  group = "Window" },
      { "<leader>ws", "<cmd>split<cr>", desc = "Horizontal Split" },
      { "<leader>wv", "<cmd>vsplit<cr>", desc = "Vertical Split" },
      { "<leader>wq", "<cmd>close<cr>", desc = "Close Split" },
      { "<leader>wo", "<cmd>only<cr>", desc = "Close Others" },
      { "<leader>w=", "<C-w>=", desc = "Equalize Splits" },
      { "<leader>w<", "<C-w><", desc = "Shrink Width" },
      { "<leader>w>", "<C-w>>", desc = "Increase Width" },
      { "<leader>w-", "<C-w>-", desc = "Shrink Height" },
      { "<leader>w+", "<C-w>+", desc = "Increase Height" },

      -- Save and Quit
      { "<leader>wS", "<cmd>w!<CR>", desc = "Save" },
      { "<leader>qq", "<cmd>confirm q<CR>", desc = "Quit" }, -- Mapped to <leader>qq

      -- trouble
      { "<leader>x", group = "Trouble" },
      { "<leader>i", function() require("conform").format() end, desc = "Format with Conform" },
    })
  end,
}
