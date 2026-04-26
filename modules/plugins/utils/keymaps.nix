_: {
  keymaps = [
    # ── markview ──────────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>mp";
      action.__raw = ''
        function()
          require("markview").actions.toggle()
        end
      '';
      options = {
        desc = "Toggle Markdown Preview";
        silent = true;
      };
    }

    # ── persistence ───────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>qs";
      action.__raw = ''
        function()
          require("persistence").load()
        end
      '';
      options = {
        silent = true;
        desc = "Restore Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qS";
      action.__raw = ''
        function()
          require("persistence").select()
        end
      '';
      options = {
        silent = true;
        desc = "Select Session";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action.__raw = ''
        function()
          require("persistence").load({ last = true })
        end
      '';
      options = {
        silent = true;
        desc = "Restore Last Session";
      };
    }
    {
      mode = "n";
      key = "<leader>qd";
      action.__raw = ''
        function()
          require("persistence").stop()
        end
      '';
      options = {
        silent = true;
        desc = "Don't Save Current Session";
      };
    }

    # ── quit ──────────────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options = {
        desc = "Quit All";
        silent = true;
      };
    }

    # ── todo-comments ─────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
          require("todo-comments").jump_next()
        end
      '';
      options = {
        silent = true;
        desc = "Next Todo Comment";
      };
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
          require("todo-comments").jump_prev()
        end
      '';
      options = {
        silent = true;
        desc = "Previous Todo Comment";
      };
    }
    # ── which-key ─────────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>?";
      action = ''<cmd>lua require("which-key").show({ global = false })<cr>'';
      options.desc = "Buffer Keymaps (which-key)";
    }
    {
      mode = "n";
      key = "<c-w><space>";
      action = ''<cmd>lua require("which-key").show({ keys = "<c-w>", loop = true })<cr>'';
      options.desc = "Window Hydra Mode (which-key)";
    }

    # ── yanky ─────────────────────────────────────────────────────────────────
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
        silent = true;
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
        silent = true;
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
        silent = true;
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
        silent = true;
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
        silent = true;
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
        silent = true;
        desc = "Put Text Before Selection";
      };
    }
    {
      mode = "n";
      key = "[y";
      action = "<Plug>(YankyCycleForward)";
      options = {
        silent = true;
        desc = "Cycle Forward Through Yank History";
      };
    }
    {
      mode = "n";
      key = "]y";
      action = "<Plug>(YankyCycleBackward)";
      options = {
        silent = true;
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
