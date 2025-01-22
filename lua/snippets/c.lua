local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = luasnip.choice_node

luasnip.add_snippets("c", {
  -- Snippet for including common headers
  s(
    "headers",
    fmt(
      [[
    #include <stdbool.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
  ]],
      {}
    )
  ),

  -- Snippet for defining the _MAX macro
  s(
    "_MAX",
    fmt(
      [[
    #define _MAX(a, b) (a > b ? a : b)
  ]],
      {}
    )
  ),

  -- Snippet for the main function with a default printf statement
  s(
    "maina",
    fmt(
      [[
    #include <stdio.h>

    int main(int argc, char *argv[]) {{
      {}
      return 0;
    }}
  ]],
      {
        i(1, ""), -- Default printf statement
      }
    )
  ),

  s(
    "functiona",
    fmt(
      [[
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define _MAX(a, b) (a > b ? a : b)
#define ll long long 
#define arr array

int main(int argc, char *argv[]) {{
  {}
  return EXIT_SUCCESS;
}}
  ]],
      {
        i(1, ""),
      }
    )
  ),
})
