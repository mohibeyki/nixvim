{
  plugins.snacks = {
    enable = true;
    settings = {
      bufdelete.enabled = true;
      indent = {
        enabled = true;
        indent.char = "│";
        scope = {
          enabled = true;
          char = "╎";
        };
      };
      dashboard = {
        enabled = true;
        preset.keys = [
          {
            icon = "󰍉 ";
            key = "f";
            desc = "Find File";
            action = "<cmd>lua Snacks.picker.files()<cr>";
          }
          {
            icon = "󱪞 ";
            key = "n";
            desc = "New File";
            action = ":ene | startinsert";
          }
          {
            icon = "󰺯 ";
            key = "g";
            desc = "Find Text";
            action = "<cmd>lua Snacks.picker.grep()<cr>";
          }
          {
            icon = "󰋚 ";
            key = "r";
            desc = "Recent Files";
            action = "<cmd>lua Snacks.picker.recent()<cr>";
          }
          {
            icon = "󰢻 ";
            key = "c";
            desc = "Config";
            action = "<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<cr>";
          }
          {
            icon = "󰦛 ";
            key = "s";
            desc = "Restore Session";
            action.__raw = ''
              function()
                require("persistence").load()
              end
            '';
          }
          {
            icon = "󰈆 ";
            key = "q";
            desc = "Quit";
            action = ":qa";
          }
        ];
        sections = [
          { section = "header"; }
          {
            section = "keys";
            gap = 1;
            padding = 1;
          }
        ];
      };
      picker.enabled = true;
      notifier = {
        enabled = true;
        timeout = 3000;
      };
      toggle = { };
      words.enabled = true;
      rename.enabled = true;
      input.enabled = true;
      scroll.enabled = true;
      explorer.enabled = true;
      quickfile.enabled = true;
      statuscolumn = {
        enabled = true;
        left = [
          "mark"
          "sign"
          "fold"
          "git"
        ];
        right = [
          "line"
          "relativenumber"
        ];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
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
      key = "<leader>E";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "Explorer Snacks (cwd)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.files()<CR>";
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
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options.desc = "Find Files (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fF";
      action.__raw = ''
        function()
          Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Find Files (cwd)";
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
          Snacks.picker.buffers({ current = false })
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
      key = "<leader>fe";
      action.__raw = ''
        function()
          Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options.desc = "Explorer Snacks (root dir)";
    }
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options.desc = "Explorer Snacks (cwd)";
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
      key = "<leader>gd";
      action = "<cmd>lua Snacks.picker.git_diff()<CR>";
      options.desc = "Git Diff (hunks)";
    }
    {
      mode = "n";
      key = "<leader>gD";
      action.__raw = ''
        function()
          Snacks.picker.git_diff({ ref = "origin/HEAD" })
        end
      '';
      options.desc = "Git Diff (origin)";
    }
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua Snacks.picker.github_issues()<CR>";
      options.desc = "GitHub Issues (open)";
    }
    {
      mode = "n";
      key = "<leader>gI";
      action.__raw = ''
        function()
          Snacks.picker.github_issues({ state = "all" })
        end
      '';
      options.desc = "GitHub Issues (all)";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua Snacks.picker.github_prs()<CR>";
      options.desc = "GitHub Pull Requests (open)";
    }
    {
      mode = "n";
      key = "<leader>gP";
      action.__raw = ''
        function()
          Snacks.picker.github_prs({ state = "all" })
        end
      '';
      options.desc = "GitHub Pull Requests (all)";
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options.desc = "Git Status";
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>lua Snacks.picker.git_stash()<CR>";
      options.desc = "Git Stash";
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options.desc = "Notification History";
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
      key = "<leader>sl";
      action = "<cmd>lua Snacks.picker.loclist()<CR>";
      options.desc = "Location List";
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
      options.desc = "Search for Plugin Spec";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options.desc = "Resume";
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
      key = "<leader>uC";
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
      options.desc = "Colorschemes";
    }
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
      options.desc = "Dismiss All Notifications";
    }
  ];

  extraConfigLua = ''
    Snacks.toggle.profiler():map("<leader>dpp")
    Snacks.toggle.profiler_highlights():map("<leader>dph")

    Snacks.toggle.new({
      id = "auto_format_global",
      name = "Auto Format (Global)",
      get = function()
        return not (vim.g.disable_autoformat or false)
      end,
      set = function(state)
        vim.g.disable_autoformat = not state
      end,
    }):map("<leader>uf")

    Snacks.toggle.new({
      id = "auto_format_buffer",
      name = "Auto Format (Buffer)",
      get = function()
        return not (vim.b.disable_autoformat or false)
      end,
      set = function(state)
        vim.b.disable_autoformat = not state
      end,
    }):map("<leader>uF")

    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.option("conceallevel", {
      off = 0,
      on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
      name = "Conceal Level",
    }):map("<leader>uc")
    Snacks.toggle.option("showtabline", {
      off = 0,
      on = vim.o.showtabline > 0 and vim.o.showtabline or 2,
      name = "Tabline",
    }):map("<leader>uA")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.dim():map("<leader>uD")
    Snacks.toggle.animate():map("<leader>ua")
    Snacks.toggle.indent():map("<leader>ug")
    Snacks.toggle.scroll():map("<leader>uS")
    if vim.lsp.inlay_hint then
      Snacks.toggle.inlay_hints():map("<leader>uh")
    end
    Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
    Snacks.toggle.zen():map("<leader>uz")

    -- Auto-open Snacks explorer when starting Neovim with a directory argument
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname ~= "" and vim.fn.isdirectory(bufname) == 1 then
          -- It's a directory, open the explorer
          vim.schedule(function()
            Snacks.explorer.open({ cwd = bufname })
          end)
        end
      end,
      desc = "Auto-open Snacks explorer on directory",
    })
  '';
}
