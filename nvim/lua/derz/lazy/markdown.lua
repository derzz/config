return {
  -- 1. Obsidian.nvim (The Core)
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- use latest release instead of main
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/quartz/content",
        },
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      
      strict = true,
      detect_workspace = "none",
      -- Link customization for Quartz compatibility
      markdown_link_func = function(opts)
        return string.format("[[%s]]", opts.label)
      end,
    },
  },

  -- 2. Visual Rendering (Makes Markdown look like Obsidian)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },

  -- 3. Image Support (Paste images from clipboard)
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir = "attachments", -- Quartz usually expects assets in a specific folder
        relative_to_current_file = true,
      },
    },
    keys = {
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
    },
  }
}
