local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node

-- helper: get current filename without extension
local function filename(_, _)
  local name = vim.fn.expand("%:t:r") -- %:t:r = file name without path or extension
  return ls.snippet_node(nil, t(name))
end


return {

    -- cls -> class Name{.....}
    s("cls", {
        t("class "),
        i(1,"Name"),
        t({" {", "    "}),
        i(2, "//body"),
        t{"", "}"}
    }),

    -- psvm -> public static void main(String[] args){...}
    s("psvm", {
        t({"public static void main(String[] args) {", "    "}),
        i(1, "//code"),
        t({"", "}"})
    }),

    -- pcm -> public class $filename{...}
    s("pcm", {
        t("public class "),
        d(1, filename, {}), -- dynamic node gets filename
        t({" {", "    "}),
        i(2, "// body"),
        t({"", "}"})
    }),

    -- sout -> System.out.println();
    s("sout", {
        t("System.out.println("), 
        i(1),
        t(");")
    }),


    -- obj -> Class var = new Class();
    s("obj", {
        i(1, "ClassName"), 
        t(" "),
        i(2, " variableName"), 
        t(" = new "), 
        i(3, "ClassName"), 
        t("("), 
        i(4, ""), 
        t(");")
    }),

}
