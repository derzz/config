return {
  -- 1. The Core Copilot Plugin (Vimscript version)
  {
    "github/copilot.vim",
    lazy = false, -- Load immediately to enable suggestions
    config = function()
      -- 1. This disables the default Tab mapping
      vim.g.copilot_no_maps = true

      -- 2. This is the "Master Switch" to stop it from popping up automatically
      -- Setting this to false (0) means it won't show anything until you ask
      vim.g.copilot_enabled = false

      -- 3. Alternatively, if you want it on but just not "auto-suggesting",
      -- you can disable it for all filetypes by default:
      -- vim.g.copilot_filetypes = { ["*"] = false }
    end,
  },

  -- 2. Copilot Chat (The UI/Interface)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- Only plenary is a hard code dependency now
    },
    build = "make utf8",
    opts = {
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.8,
        relative = 'editor',
        border = 'rounded',
      },
    },
    lazy = false,
  },
}
