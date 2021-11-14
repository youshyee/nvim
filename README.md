## <center>The My NeoVim Config </center>

## Install neovim at least 6.00 for copilot plugin

See the install instruction at [here](https://github.com/neovim/neovim/wiki/Installing-Neovim)

## After Installation, You Need To
- [ ] Install `pynvim` (pip)
- [ ] Install `ripgrep` (pacman)
- [ ] Install `ranger` (pacman)
- [ ] Install `fzf`
- [ ] Install `nodejs`, and do `npm install -g neovim`
- [ ] Install `figlet` for inputing text ASCII art
- [ ] Install `xclip` for system clipboard access (`Linux` and `xorg` only)
- [ ] Install nerd-fonts (actually it's optional but it looks real good)

## After Installation, You Might Want To
### First of all
- [ ] Do `:checkhealth`

### For Python Debugger (via `vimspector`)
- [ ] Install `debugpy` (`pip`)

### Config `Python` path
- [ ] Well, make sure you have python
- [ ] See `_machine_specific.vim`

### setup copilot
run `:Copilot setup` and activate the device

#### vim-surround
To add surround (`string` -> `"string"`):
```
string
```
press: `yskw'`:
```
'string'
```

To change surround
```
'string'
```
press: `cs'"`:
```
"string"
```

<img alt="Gif" src="https://two-wrongs.com/image/surround_vim.gif" width="60%" />

#### vim-subversive
New operator: `s`:

You can execute `s<motion>` to substitute the text object provided by the motion with the contents of the default register (or an explicit register if provided). For example, you could execute `skw` to replace the current word under the cursor with the current yank, or `skp` to replace the paragraph, etc.
