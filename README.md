# dotfiles
`.` files, managed with [chezmoi](https://github.com/twpayne/chezmoi)

## On a new machine
1. Install homebrew:

```bash
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

2. Install chezmoi:

```bash
brew install chezmoi
```

3. Init dotfiles:

```bash
chezmoi init jiachengxu -S ~/projects/personal/dotfiles
```

4. Edit config file:
```bash
vim ~/.config/chezmoi/chezmoi.yaml 
```

5. Apply the change:
```bash
chezmoi apply
```

6. Misc:
- Run `:PlugInstall` to install vim plugin.
- Install iterm and [gruvbox theme](https://iterm2colorschemes.com/).
- Install [meslo nerd font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) for p10k.
