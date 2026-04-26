{
  pkgs,
  lib,
  ...
}:
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
    cursorlineopt = "both"; # Highlight both line and line number
    signcolumn = "yes"; # Always show sign column
    termguicolors = true; # Enable 24-bit colors
    cmdheight = 1; # Default command line height (noice handles cmdline UI)
    showmode = false; # Don't show mode (use lualine instead)
    showtabline = 2; # Always show tabline for bufferline

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
    inccommand = "split"; # Live preview of substitutions
    diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram";

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
    timeoutlen = 300; # Which-key timeout (ms)

    # --------------------------------------------------------------------------
    # Persistence
    # --------------------------------------------------------------------------
    swapfile = false; # Don't create swap files
    backup = false; # Don't create backup files
    undofile = true; # Enable persistent undo
    autoread = true; # Auto-reload changed files

    # --------------------------------------------------------------------------
    # Misc
    # --------------------------------------------------------------------------
    colorcolumn = "80";

    # Whitespace visualization
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
      extends = "›";
      precedes = "‹";
    };

    # Fill characters
    fillchars = {
      diff = "╱";
      eob = " ";
    };

    # Window title for window managers
    title = true;
    titlestring = "%t - NVIM";

    # Command-line completion
    wildmode = "longest:full,full";

    # Completion menu settings
    completeopt = "menu,menuone,noselect";
    pumheight = 10;
  };

  extraConfigLua = ''
    -- Centralized undo files
    vim.opt.undodir = vim.fn.stdpath("data") .. "/undo//"
    vim.fn.mkdir(vim.opt.undodir:get()[1], "p")

    -- Auto-clean stale undo files on exit
    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        local undodir = vim.fn.stdpath("data") .. "/undo"
        local handle = vim.uv.fs_scandir(undodir)
        if not handle then
          return
        end
        repeat
          local name, _ = vim.uv.fs_scandir_next(handle)
          if not name then
            break
          end
          -- Vim encodes path separators as %, decode back
          local path = name:gsub("%%", "/"):sub(2)
          if not vim.uv.fs_stat(path) then
            vim.uv.fs_unlink(undodir .. "/" .. name)
          end
        until not name
      end,
    })
  '';
}
