return {
  'stevearc/overseer.nvim',
  opts = {
    templates = { "builtin" },
  },
  config = function(_, opts)
    local overseer = require('overseer')
    overseer.setup(opts)

    -- Define the Quartz Task specifically for your ~/notes
    overseer.register_template({
      name = "quartzServe",
      builder = function()
        return {
          cmd = { "npx", "quartz", "build", "--serve" },
          cwd = vim.fn.expand("~/quartz"), 
          components = {
            "on_exit_set_status",
            "on_complete_notify",
            "default",
          },
        }
      end,
      -- This makes it only show up when you are in your notes folder
      condition = {
        callback = function()
          return vim.fn.getcwd():find(vim.fn.expand("~/notes"), 1, true) ~= nil
        end,
      },
    })
  end,
}
