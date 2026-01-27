# dotfiles

Personal dotfiles managed with [chezmoi](https://github.com/twpayne/chezmoi).

## What's Included

- **Terminal**: Ghostty with Flexoki Light theme
- **Shell**: zsh with oh-my-zsh and powerlevel10k
- **Multiplexer**: tmux with Flexoki Light powerline theme
- **Editor**: vim, neovim, ideavim
- **Kubernetes**: k9s with Flexoki skins
- **AI**: opencode with oh-my-opencode

## Setup on a New Machine

1. Install Homebrew:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install chezmoi:

```bash
brew install chezmoi
```

3. Initialize dotfiles:

```bash
chezmoi init jiachengxu -S ~/projects/personal/dotfiles
```

4. Review and apply:

```bash
chezmoi diff
chezmoi apply
```

## Post-Setup

- Install [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) font for powerlevel10k and terminal
- Install [Ghostty](https://ghostty.org/) terminal
- Run `tmux` and press `prefix + I` to install tmux plugins
