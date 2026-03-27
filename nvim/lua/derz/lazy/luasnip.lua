return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*",
  -- install jsregexp (optional but recommended for complex snippets)
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    -- Snippet Engine Configuration
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- Define the Furigana Snippet
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    ls.add_snippets("markdown", {
      s("furi", {
        t("<ruby>"), i(1, "kanji"), t("<rt>"), i(2, "reading"), t("</rt></ruby>"),
      }),
    })
  end,
}
