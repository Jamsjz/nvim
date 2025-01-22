local luasnip = require("luasnip")
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("nix", {
  -- Snippet for creating a Nix shell environment
  s(
    "pythonenv",
    fmt(
      [[
{{ pkgs ? import <nixpkgs> {{ }} }}:

pkgs.mkShell {{
  buildInputs = with pkgs.python3Packages;
  [
    {}
  ];

  shellHook = ''
    zsh
  '';
}}
]],
      {
        i(1, ""), -- Placeholder for build inputs
      }
    )
  ),
})
