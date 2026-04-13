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
    ├── ai/                # AI plugins (opencode)
    ├── coding/            # Coding plugins (ts-comments, mini.ai, mini.surround)
    ├── colorscheme/       # Theme (rose-pine)
    ├── completion/        # Completion (blink.cmp)
    ├── dap/               # Debugging (nvim-dap, dap-ui, dap-go, dap-python)
    ├── editor/            # Editor tools (conform, flash, refactoring, snacks.picker, snacks.explorer, ...)
    ├── git/               # Git plugins (gitsigns + snacks lazygit/git integration)
    ├── linting/           # Linting (nvim-lint)
    ├── lsp/               # LSP configuration + trouble
    ├── treesitter/        # Treesitter + context + textobjects
    ├── ui/                # UI plugins (lualine, bufferline, noice, snacks.dashboard, ...)
    └── utils/             # Utilities (which-key, yanky, persistence, todo-comments, markview)
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
