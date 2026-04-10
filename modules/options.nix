{ pkgs, lib, ... }:
{
  # ============================================================================
  # Performance Optimization
  # ============================================================================
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };

  # ============================================================================
  # Clipboard Configuration
  # ============================================================================
  clipboard = {
    # Use system clipboard
    register = "unnamedplus";

    providers = lib.mkIf pkgs.stdenv.isLinux {
      wl-copy = {
        enable = true;
        package = pkgs.wl-clipboard;
      };
    };
  };

  # ============================================================================
  # Diagnostic Configuration (vim.diagnostic)
  # ============================================================================
  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;
    virtual_text = true;
    signs = true;
    underline = true;
  };

  # ============================================================================
  # Core Vim Options (vim.opt)
  # ============================================================================
  opts = {
    # --------------------------------------------------------------------------
    # Display
    # --------------------------------------------------------------------------
    # Line numbers
    number = true; # Show absolute line numbers
    relativenumber = true; # Show relative line numbers
    cursorline = true; # Highlight current line
    signcolumn = "yes"; # Always show sign column
    termguicolors = true; # Enable 24-bit colors
    cmdheight = 0; # Hide command line (use noice instead)
    showmode = false; # Don't show mode (use lualine instead)
    showtabline = 0; # Hide tabline (use bufferline instead)

    # --------------------------------------------------------------------------
    # Indentation & Tabs
    # --------------------------------------------------------------------------
    expandtab = true; # Use spaces instead of tabs
    tabstop = 2; # Number of spaces for a tab
    softtabstop = 2; # Number of spaces when pressing Tab
    shiftwidth = 2; # Number of spaces for autoindent
    smartindent = true; # Smart autoindenting

    # --------------------------------------------------------------------------
    # Text & Wrap
    # --------------------------------------------------------------------------
    wrap = true; # Enable text wrapping
    breakindent = true; # Indent wrapped lines
    scrolloff = 8; # Keep 8 lines above/below cursor

    # --------------------------------------------------------------------------
    # Search
    # --------------------------------------------------------------------------
    hlsearch = true; # Highlight search results
    incsearch = true; # Show matches while typing
    ignorecase = true; # Ignore case when searching
    smartcase = true; # Don't ignore case with capitals
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # --------------------------------------------------------------------------
    # Window Management
    # --------------------------------------------------------------------------
    splitbelow = true; # New horizontal splits below
    splitright = true; # New vertical splits to the right

    # --------------------------------------------------------------------------
    # Input & Timing
    # --------------------------------------------------------------------------
    mouse = "a"; # Enable mouse in all modes
    updatetime = 200; # Faster completion (default 4000ms)
    timeoutlen = 500; # Which-key timeout (ms)

    # --------------------------------------------------------------------------
    # Completion (for blink-cmp)
    # --------------------------------------------------------------------------
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];

    # --------------------------------------------------------------------------
    # Persistence
    # --------------------------------------------------------------------------
    swapfile = false; # Don't create swap files
    backup = false; # Don't create backup files
    undofile = true; # Enable persistent undo
    autoread = true; # Auto-reload changed files

    # --------------------------------------------------------------------------
    # Folds (configured for nvim-ufo)
    # --------------------------------------------------------------------------
    # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # --------------------------------------------------------------------------
    # Encoding
    # --------------------------------------------------------------------------
    encoding = "utf-8";
    fileencoding = "utf-8";

    # --------------------------------------------------------------------------
    # Misc
    # --------------------------------------------------------------------------
    colorcolumn = "80";
  };
}
