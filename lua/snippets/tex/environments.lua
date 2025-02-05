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
local i1 = { i(1) }
local i2 = { i(1), i(2) }
return {
  s(
    { trig = "eq" },
    fmta(
      [[
       \begin{equation*}
           <>
       \end{equation*}
     ]],
      i1
    )
  ),
  s(
    { trig = "doc" },
    fmta(
      [[
       \begin{document}
           <>
       \end{document}
     ]],
      i1
    )
  ),
  s(
    { trig = "use" },
    fmta(
      [[
      \usepackage{<>}
      ]],
      i1
    )
  ),
  s(
    { trig = ";start", snippetType = "autosnippet" },
    fmta(
      [[
   \documentclass[11pt]{article}
   \usepackage{amsmath,amsfonts,amssymb}
   \usepackage{float}
   \parindent 0px
   \pagestyle{empty}
   \begin{document}
   <>
   \end{document}
  ]],
      i1
    )
  ),
}
