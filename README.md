<p style="vertical-align:center; horizontal-align:left; font-size:150px">
<img src="https://github.com/uiua-lang/uiua/blob/main/site/uiua-logo.png" width="128"/>
&#10133;
<img src="https://www.vim.org/images/vimlogo.svg" width="128"/>
&#10140;
<img src="logo/uiua-vim-logo.png"/>
</p>

# uiua.vim

This is a simple Vim plugin that provides [Uiua](https://uiua.org) integration. Features include:

* file detection
* syntax highlighting
* commands and code evaluation (see below)

## Installation

Install using your favorite package manager.

### [vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'sputnick1124/uiua.vim'
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
require("lazy").setup({
    "sputnick1124/uiua.vim",
})
```

## Features

* `:UiuaRun` - run the current file
* `:UiuaTest` - test the current file
* `:UiuaFmt` - format the current file
* `:UiuaEval` - evaluate the current line (or visual range)
* `:UiuaPad` - create link to [Uiua pad](https://uiua.org/pad) with current buffer (or selected visual range)
   * URL will be copied to system clipboard if `g:uiua_clip_command` is provided

## Todo
- [ ] Optional automatic LSP setup (for neovim >= 0.8.0)
- [ ] `:UiuaWatch`
- [ ] Statusline addon
- [x] Logo
