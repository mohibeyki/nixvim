# Nixvim Configuration

A modern, modular Neovim configuration built with [nixvim](https://github.com/nix-community/nixvim).

## Features

- **Modern Completion**: blink.cmp with LSP, path, and buffer sources
- **File Finding**: snacks.nvim picker (replaces telescope)
- **Git Integration**: gitsigns + lazygit with full hunk support
- **LSP Setup**: Centralized language configuration via `languages.nix`
- **Formatting**: conform.nvim with per-language formatters
- **Linting**: nvim-lint with auto-configuration
- **UI Polish**: noice + notify + lualine + bufferline
- **LazyVim-style**: Follows LazyVim keymap conventions

## Structure

```
modules/
├── languages.nix          # Central language definitions (LSP, formatters, linters, treesitter)
├── options.nix            # Core vim options and settings
├── keys.nix               # Global keymaps
├── autocommands.nix       # Auto commands
└── plugins/
    ├── coding/            # Coding plugins (ts-comments)
    ├── colorscheme/       # Theme (rose-pine)
    ├── completion/        # Completion (blink)
    ├── editor/            # Editor tools (conform, outline, refactoring)
    ├── git/               # Git plugins (gitsigns, lazygit)
    ├── linting/           # Linting (nvim-lint)
    ├── lsp/               # LSP configuration
    ├── treesitter/        # Treesitter + textobjects
    ├── ui/                # UI plugins (lualine, bufferline, noice)
    └── utils/             # Utilities (snacks, flash, yanky, etc.)
```

## Keymaps

Leader key: `Space`

### Navigation
- `<leader><space>` - Find files
- `<leader>/` - Grep (search text)
- `<leader>e` - File explorer
- `<leader>,` - Buffers

### LSP
- `gd` - Goto definition
- `gr` - References
- `K` - Hover
- `<leader>ca` - Code action
- `<leader>cr` - Rename

### Git
- `<leader>gg` - LazyGit
- `]h` / `[h` - Next/prev hunk
- `<leader>ghs` - Stage hunk
- `<leader>ghr` - Reset hunk

### Buffers
- `<leader>bd` - Delete buffer
- `<leader>bD` - Delete other buffers
- `[b` / `]b` - Prev/next buffer

See `modules/keys.nix` and individual plugin files for more.

## Installation

```bash
# Build and run
nix run .#

# Or install
nix profile install .
```

## Configuration

Add languages in `modules/languages.nix`:

```nix
myLanguage = {
  filetypes = [ "ext" ];
  lsp = "lsp-server";
  formatter = "formatter-name";
  linters = [ "linter1" "linter2" ];
  treesitter = "grammar";
};
```

## Requirements

- Nix with flakes enabled
- Nerd Font (for icons)

## License

GPLv3
