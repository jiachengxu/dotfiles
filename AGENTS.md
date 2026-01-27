# Dotfiles Repository Guidelines

Personal dotfiles managed with [chezmoi](https://chezmoi.io/). This is a configuration repository, not a code project.

## Repository Structure

```
dotfiles/
├── dot_*                    # Files prefixed with dot_ become .* in home directory
├── dot_config/              # Maps to ~/.config/
│   ├── ghostty/             # Terminal emulator config
│   ├── k9s/                 # Kubernetes TUI config + skins
│   └── opencode/            # AI coding assistant config
├── .chezmoi.yaml            # Chezmoi local config
├── .chezmoidata.yaml        # Template data (brew packages list)
├── .chezmoiexternal.yaml    # External dependencies (oh-my-zsh, vim-plug, etc.)
├── .chezmoiignore           # Files to ignore during apply
└── run_onchange_*.sh.tmpl   # Scripts that run on changes
```

## Commands

```bash
# Preview changes before applying
chezmoi diff

# Apply dotfiles to home directory
chezmoi apply

# Add a new file to be managed
chezmoi add ~/.some-config

# Edit a managed file (opens source, not target)
chezmoi edit ~/.zshrc

# Re-add a file after editing target directly
chezmoi re-add ~/.zshrc

# Update external dependencies
chezmoi update
```

## Naming Conventions

Chezmoi uses special prefixes. Always use the correct prefix:

| Prefix | Meaning | Example |
|--------|---------|---------|
| `dot_` | Becomes `.` | `dot_zshrc` → `~/.zshrc` |
| `private_` | chmod 600 | `private_config.yaml` |
| `executable_` | chmod +x | `executable_script.sh` |
| `run_` | Execute on apply | `run_onchange_*.sh` |
| `*.tmpl` | Go template | Uses `.chezmoidata.yaml` |

## File Organization & Style

### Shell Scripts (zsh, bash)

Use clear section headers with consistent formatting:

```bash
# =============================================================================
# Section Name
# =============================================================================

# subsection or inline comment
some_command
```

- Group related settings together
- Keep sections in logical order (prompt → shell → env → path → completions → aliases → functions → secrets)
- Use `[[ -f file ]] && source file` pattern for optional sources
- Use zsh array syntax for PATH: `path=(... $path); typeset -U path`

### Config Files (yaml, toml, json)

- Use 2-space indentation for YAML
- Use 4-space indentation for JSON (match existing)
- Group related settings with blank lines
- Add section comments for long configs

### tmux Config

- Use section headers matching the zsh style
- Define color palette at top of theme section
- Keep powerline segments readable with comments
- Plugin config goes at the bottom, TPM init at the very end

## Theme: Flexoki Light

This dotfiles uses Flexoki Light theme consistently. Key colors:

```
Paper (bg):  #FFFCF0
UI:          #E6E4D9
Text (fg):   #100F0F
Blue:        #205EA6
Cyan:        #24837B
Green:       #66800B
Yellow:      #AD8301
Red:         #AF3029
Purple:      #5E409D
```

When adding new configs, use these colors for consistency.

## External Dependencies

Managed via `.chezmoiexternal.yaml`:

- **oh-my-zsh** - zsh framework
- **powerlevel10k** - zsh theme (pinned to v1.15.0)
- **zsh-syntax-highlighting** - syntax highlighting
- **zsh-autosuggestions** - fish-like suggestions
- **vim-plug** - vim plugin manager

To add a new external dependency:

```yaml
.path/to/target:
  type: archive  # or 'file' for single files
  url: 'https://github.com/user/repo/archive/master.tar.gz'
  exact: true
  stripComponents: 1
  refreshPeriod: 168h  # 1 week
```

## Homebrew Packages

Managed via `.chezmoidata.yaml`. Add packages to the appropriate list:

```yaml
packages:
  darwin:
    brews:
      - "package-name"
    casks:
      - "app-name"
```

Packages install automatically via `run_onchange_darwin-install-packages.sh.tmpl`.

## Secrets

**NEVER commit secrets to this repository.**

Secrets are sourced from `~/.secrets` (not tracked):

```bash
# ~/.secrets (create manually, not in this repo)
export ANTHROPIC_API_KEY="..."
export OPENAI_API_KEY="..."
```

The pattern `[[ -f ~/.secrets ]] && source ~/.secrets` in `.zshrc` loads them.

## Making Changes

1. Edit source files in this repo (not `~/.config/*` directly)
2. Run `chezmoi diff` to preview
3. Run `chezmoi apply` to apply
4. Commit changes to git

If you edited a target file directly by mistake:
```bash
chezmoi re-add ~/.the-file-you-edited
```

## Testing Changes

For shell configs:
```bash
# Start a new shell to test zshrc changes
zsh

# Or source directly (may have side effects)
source ~/.zshrc
```

For tmux:
```bash
# Reload config inside tmux
tmux source-file ~/.tmux.conf
# Or use the keybind: prefix + r
```

## Validation

No automated tests. Manual verification:

1. `chezmoi diff` - ensure changes look correct
2. `chezmoi apply` - apply and verify no errors
3. Open new terminal/tmux session to verify behavior
4. Check for syntax errors in shell: `zsh -n ~/.zshrc`

## Common Pitfalls

- **Editing wrong file**: Always edit source (`chezmoi edit`), not target
- **Forgetting to apply**: Changes to source don't auto-apply
- **Template syntax**: `.tmpl` files use Go templates, escape `{{` if literal
- **PATH order**: Earlier entries in zsh `path=()` array take precedence
- **Private files**: Use `private_` prefix for sensitive configs (k9s, etc.)
