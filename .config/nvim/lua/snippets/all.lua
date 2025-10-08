local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("hw", { t("Hello, world!") }),

  s("sig", {
    t("Best regards,"), t({"", ""}),
    i(1, "Your Name"),
  }),
}
