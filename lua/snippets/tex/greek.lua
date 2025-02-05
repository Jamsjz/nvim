local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
return {
  s({ trig = ";a", snippetType = "autosnippet", wordTrig = false }, { t("\\alpha ") }),
  s({ trig = ";b", snippetType = "autosnippet", wordTrig = false }, { t("\\beta ") }),
  s({ trig = ";g", snippetType = "autosnippet", wordTrig = false }, { t("\\gama ") }),
  s({ trig = ";o", snippetType = "autosnippet", wordTrig = false }, { t("\\theta ") }),
  s({ trig = ";e", snippetType = "autosnippet", wordTrig = false }, { t("\\epsilon ") }),
  s({ trig = ";d", snippetType = "autosnippet", wordTrig = false }, { t("\\delta ") }),
  s({ trig = ";V", snippetType = "autosnippet", wordTrig = false }, { t("\\forall ") }),
  s({ trig = ";OE", snippetType = "autosnippet", wordTrig = false }, { t("\\exists ") }),
}
