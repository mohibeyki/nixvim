{
  plugins.yanky = {
    enable = true;
    settings = {
      highlight = {
        timer = 150;
      };
      system_clipboard = {
        sync_with_ring = true;
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>p";
      action.__raw = ''
        function()
          require("snacks").picker.yanky()
        end
      '';
      options = {
        desc = "Open Yank History";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "y";
      action = "<Plug>(YankyYank)";
      options = {
        desc = "Yank Text";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options = {
        desc = "Put Text After Cursor";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options = {
        desc = "Put Text Before Cursor";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "gp";
      action = "<Plug>(YankyGPutAfter)";
      options = {
        desc = "Put Text After Selection";
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "gP";
      action = "<Plug>(YankyGPutBefore)";
      options = {
        desc = "Put Text Before Selection";
      };
    }
    {
      mode = "n";
      key = "[y";
      action = "<Plug>(YankyCycleForward)";
      options = {
        desc = "Cycle Forward Through Yank History";
      };
    }
    {
      mode = "n";
      key = "]y";
      action = "<Plug>(YankyCycleBackward)";
      options = {
        desc = "Cycle Backward Through Yank History";
      };
    }
    {
      mode = "n";
      key = "]p";
      action = "<Plug>(YankyPutIndentAfterLinewise)";
      options.desc = "Put Indented After Cursor (Linewise)";
    }
    {
      mode = "n";
      key = "[p";
      action = "<Plug>(YankyPutIndentBeforeLinewise)";
      options.desc = "Put Indented Before Cursor (Linewise)";
    }
    {
      mode = "n";
      key = "]P";
      action = "<Plug>(YankyPutIndentAfterLinewise)";
      options.desc = "Put Indented After Cursor (Linewise)";
    }
    {
      mode = "n";
      key = "[P";
      action = "<Plug>(YankyPutIndentBeforeLinewise)";
      options.desc = "Put Indented Before Cursor (Linewise)";
    }
    {
      mode = "n";
      key = ">p";
      action = "<Plug>(YankyPutIndentAfterShiftRight)";
      options.desc = "Put and Indent Right";
    }
    {
      mode = "n";
      key = "<p";
      action = "<Plug>(YankyPutIndentAfterShiftLeft)";
      options.desc = "Put and Indent Left";
    }
    {
      mode = "n";
      key = ">P";
      action = "<Plug>(YankyPutIndentBeforeShiftRight)";
      options.desc = "Put Before and Indent Right";
    }
    {
      mode = "n";
      key = "<P";
      action = "<Plug>(YankyPutIndentBeforeShiftLeft)";
      options.desc = "Put Before and Indent Left";
    }
    {
      mode = "n";
      key = "=p";
      action = "<Plug>(YankyPutAfterFilter)";
      options.desc = "Put After Applying a Filter";
    }
    {
      mode = "n";
      key = "=P";
      action = "<Plug>(YankyPutBeforeFilter)";
      options.desc = "Put Before Applying a Filter";
    }
  ];
}
