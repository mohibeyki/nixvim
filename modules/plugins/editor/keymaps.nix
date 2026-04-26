{
  config,
  lib,
  ...
}:
{
  keymaps = [
    # ── mini.visits ───────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>vr";
      action.__raw = ''
        function()
          require("mini.visits").list_paths()
        end
      '';
      options = {
        desc = "Recent Locations (Visits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>vl";
      action.__raw = ''
        function()
          require("mini.visits").list_labels()
        end
      '';
      options = {
        desc = "Visit Labels";
        silent = true;
      };
    }
  ]
  # ── refactoring ───────────────────────────────────────────────────────────
  ++ lib.optionals config.plugins.refactoring.enable [
    {
      mode = "n";
      key = "<leader>rb";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Block")
        end
      '';
      options = {
        desc = "Extract Block";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rB";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Block To File")
        end
      '';
      options = {
        desc = "Extract Block To File";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rf";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function")
        end
      '';
      options = {
        desc = "Extract Function";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rF";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function To File")
        end
      '';
      options = {
        desc = "Extract Function To File";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rv";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Variable")
        end
      '';
      options = {
        desc = "Extract Variable";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ri";
      action.__raw = ''
        function()
          require("refactoring").refactor("Inline Variable")
        end
      '';
      options = {
        desc = "Inline Variable";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rp";
      action.__raw = ''
        function()
          require("refactoring").debug.printf({ below = false })
        end
      '';
      options = {
        desc = "Debug Print (Below)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rP";
      action.__raw = ''
        function()
          require("refactoring").debug.printf({ below = true })
        end
      '';
      options = {
        desc = "Debug Print (Above)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rc";
      action.__raw = ''
        function()
          require("refactoring").debug.cleanup({})
        end
      '';
      options = {
        desc = "Cleanup Debug Prints";
        silent = true;
      };
    }
  ]
  ++ [
    # ── snacks.picker ─────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.files({ hidden = true })<CR>";
      options = {
        desc = "Find Files (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {
        desc = "Buffers";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>.";
      action = "<cmd>lua Snacks.scratch()<CR>";
      options = {
        desc = "Toggle Scratch Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        desc = "Grep (Root Dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options = {
        desc = "Command History";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>S";
      action = "<cmd>lua Snacks.scratch.select()<CR>";
      options.desc = "Select Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>dps";
      action = "<cmd>lua Snacks.profiler.scratch()<CR>";
      options.desc = "Profiler Scratch Buffer";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files({ hidden = true })<CR>";
      options.desc = "Find Files (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      mode = "n";
      key = "<leader>fB";
      action.__raw = ''
        function()
          Snacks.picker.buffers({ filter = { hidden = true } })
        end
      '';
      options.desc = "Buffers (all)";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>";
      options.desc = "Find Config File";
    }
    {
      mode = "n";
      key = "<leader>fF";
      action.__raw = ''
        function()
          Snacks.picker.files({ cwd = vim.fn.expand("%:p:h"), hidden = true })
        end
      '';
      options.desc = "Find Files (cwd)";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = ''
        function()
          Snacks.picker.git_files()
        end
      '';
      options.desc = "Find Files (git-files)";
    }
    {
      mode = "n";
      key = "<leader>fp";
      action.__raw = ''
        function()
          Snacks.picker.projects()
        end
      '';
      options.desc = "Projects";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options.desc = "Recent";
    }
    {
      mode = "n";
      key = "<leader>fR";
      action.__raw = ''
        function()
          Snacks.picker.recent({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Recent (cwd)";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>sG";
      action.__raw = ''
        function()
          Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Grep (cwd)";
    }
    {
      mode = "n";
      key = ''<leader>s"'';
      action = "<cmd>lua Snacks.picker.registers()<CR>";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action = "<cmd>lua Snacks.picker.search_history()<CR>";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>lua Snacks.picker.autocmds()<CR>";
      options.desc = "Autocmds";
    }
    {
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options.desc = "Buffer Lines";
    }
    {
      mode = "n";
      key = "<leader>sB";
      action = "<cmd>lua Snacks.picker.grep_buffers()<CR>";
      options.desc = "Grep Open Buffers";
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>lua Snacks.picker.commands()<CR>";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sD";
      action.__raw = ''
        function()
          Snacks.picker.diagnostics({ filter = { buf = 0 } })
        end
      '';
      options.desc = "Buffer Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>lua Snacks.picker.help()<CR>";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>sH";
      action = "<cmd>lua Snacks.picker.highlights()<CR>";
      options.desc = "Highlights";
    }
    {
      mode = "n";
      key = "<leader>si";
      action = "<cmd>lua Snacks.picker.icons()<CR>";
      options.desc = "Icons";
    }
    {
      mode = "n";
      key = "<leader>sj";
      action = "<cmd>lua Snacks.picker.jumps()<CR>";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>lua Snacks.picker.marks()<CR>";
      options.desc = "Marks";
    }
    {
      mode = "n";
      key = "<leader>sM";
      action = "<cmd>lua Snacks.picker.man()<CR>";
      options.desc = "Man Pages";
    }
    {
      mode = "n";
      key = "<leader>sp";
      action = "<cmd>lua Snacks.picker.lazy()<CR>";
      options.desc = "Search Plugin Configs";
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options.desc = "Resume";
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>lua Snacks.picker.loclist()<CR>";
      options.desc = "Location List";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }
    {
      mode = "n";
      key = "<leader>su";
      action = "<cmd>lua Snacks.picker.undo()<CR>";
      options.desc = "Undotree";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>sw";
      action = "<cmd>lua Snacks.picker.grep_word()<CR>";
      options.desc = "Visual selection or word (Root Dir)";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>sW";
      action.__raw = ''
        function()
          Snacks.picker.grep_word({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Visual selection or word (cwd)";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      options.desc = "LSP Symbols";
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      options.desc = "LSP Workspace Symbols";
    }
    {
      mode = "n";
      key = "<leader>st";
      action.__raw = ''
        function()
          Snacks.picker.todo()
        end
      '';
      options.desc = "Todo";
    }
    {
      mode = "n";
      key = "<leader>sT";
      action.__raw = ''
        function()
          Snacks.picker.todo({ keywords = { "TODO", "FIX", "FIXME" } })
        end
      '';
      options.desc = "Todo/Fix/Fixme";
    }

    # ── snacks.terminal ───────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = ''
        function()
          Snacks.terminal.toggle()
        end
      '';
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fT";
      action.__raw = ''
        function()
          Snacks.terminal.toggle({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Terminal (cwd)";
    }

    # ── snacks.explorer ───────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = ''
        function()
          Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options = {
        desc = "Explorer (root dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "Explorer (cwd)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = ''
        function()
          Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options = {
        desc = "Explorer Snacks (root dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "Explorer Snacks (cwd)";
        silent = true;
      };
    }
  ];
}
