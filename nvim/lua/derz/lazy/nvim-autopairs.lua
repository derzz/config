return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local autopairs = require("nvim-autopairs")
        autopairs.setup({
            check_ts = true,
            disable_filetype = { "markdown", "vimwiki" },
        })

        -- Keep your cmp integration for other filetypes (Lua, Python, etc.)
        local cmp_status, cmp = pcall(require, 'cmp')
        if cmp_status then
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
              'confirm_done',
              cmp_autopairs.on_confirm_done()
            )
        end
    end
}
