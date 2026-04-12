{
  autoCmd = [
    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = [
        "tex"
        "markdown"
      ];
      command = "setlocal spell spelllang=en";
    }

    # Enter git buffer in insert mode
    {
      event = "FileType";
      pattern = [
        "gitcommit"
        "gitrebase"
      ];
      command = "startinsert | 1";
    }

    # Auto-resize splits when window is resized
    {
      event = "VimResized";
      pattern = "*";
      command = "wincmd =";
    }

    # Highlight yanked region briefly
    {
      event = "TextYankPost";
      pattern = "*";
      callback.__raw = ''
        function()
          vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
        end
      '';
    }

    # Auto-save session on buffer write
    {
      event = "BufWritePre";
      pattern = "*";
      callback.__raw = ''
        function()
          if vim.bo.filetype ~= "gitcommit" and vim.bo.filetype ~= "gitrebase" then
            require("persistence").save()
          end
        end
      '';
    }

    # Auto-restore session on startup (if no arguments provided)
    {
      event = "VimEnter";
      pattern = "*";
      nested = true;
      callback.__raw = ''
        function()
          if vim.fn.argc() == 0 and not vim.g.started_with_stdin then
            require("persistence").load()
          end
        end
      '';
    }
  ];
}
