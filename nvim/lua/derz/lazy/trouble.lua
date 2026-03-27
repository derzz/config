return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    -- This ensures we see the line numbers clearly in the list
    modes = {
      diagnostics = {
        format = "{severity_icon} {message} {pos} {source}", 
      },
    },
  },
}
