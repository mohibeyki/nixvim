{
  globals.mapleader = " ";

  keymaps = [
    # Clear search with <Esc> (LazyVim style)
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<Esc>";
      action = "<cmd>nohl<CR><Esc>";
      options = {
        desc = "Escape and Clear hlsearch";
      };
    }

    # Save file
    {
      mode = [
        "i"
        "x"
        "n"
        "s"
      ];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Quit
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    # UI toggles
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    # Move lines in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selected lines down";
      };
    }

    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selected lines up";
      };
    }

    # Keep cursor centered
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        desc = "Join lines and keep cursor position";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Scroll down and center cursor";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Scroll up and center cursor";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Next search result and center";
      };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Previous search result and center";
      };
    }

    # Delete to void register (preserve clipboard)
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>D";
      action = ''"_d'';
      options = {
        desc = "Delete to void register";
      };
    }

    # Escape in insert mode
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
      options = {
        desc = "Exit insert mode";
      };
    }

    # Previous/Next buffer
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Prev buffer";
      };
    }

    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next buffer";
      };
    }

    # Switch to other buffer
    {
      mode = "n";
      key = "<leader>`";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }
  ];

  extraConfigLua = ''
    function ToggleLineNumber()
      if vim.wo.number then
        vim.wo.number = false
      else
        vim.wo.number = true
        vim.wo.relativenumber = false
      end
    end

    function ToggleRelativeLineNumber()
      if vim.wo.relativenumber then
        vim.wo.relativenumber = false
      else
        vim.wo.relativenumber = true
        vim.wo.number = false
      end
    end

    function ToggleWrap()
      vim.wo.wrap = not vim.wo.wrap
    end
  '';
}
