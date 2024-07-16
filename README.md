# Neovim Config

This is a full fledged config for neovim.

## Installation

1. Make backup of your config

```bash
cp -r ~/.config ~/.config.bak
mv .local/share/nvim ~/.local/share/nvim.bak
mv .local/cache/nvim ~/.local/cache/nvim.bak
```

2. Clone this repo in $HOME/.config folder

```bash
git clone https://github.com/Jamsjz/nvim-config.git ~/.config
```

3. All done!

Here is the script:

```bash
#!/bin/bash
# This script will install all the plugins and config for neovim
# It will also backup your current config

# Backup your current config
cp -r ~/.config ~/.config.bak
mv .local/share/nvim ~/.local/share/nvim.bak
mv .local/cache/nvim ~/.local/cache/nvim.bak

# Clone the repo
git clone https://github.com/Jamsjz/nvim-config.git ~/.config
```

## Main Features

***LazyVim Derivative***
--

- Treesitter
- LSP
- Autocomplete
- Code Runner
- Comment
- Tagbar
- Multiline
- Notify
- Toggle Tabbar
- Vim and Tmux Navigator
- Surround
- Terminal
- Harpoon
- Oil
- Zen-mode
- Lualine
- Luasnip
- Bufremove
- Vim be good

***Neovide***

Use neovide for better nvim experience if you have it installed.
Note: This is not a neovide config, it also works with neovide.
