_: {
  keymaps = [
    # ── lazygit ───────────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''
        function()
          Snacks.lazygit({ cwd = Snacks.git.get_root() })
        end
      '';
      options = {
        silent = true;
        desc = "Lazygit (Root Dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>gG";
      action.__raw = ''
        function()
          Snacks.lazygit()
        end
      '';
      options = {
        silent = true;
        desc = "Lazygit (cwd)";
      };
    }

    # ── gitsigns ──────────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "]h";
      action.__raw = ''
        function()
          require("gitsigns").next_hunk()
        end
      '';
      options = {
        desc = "Next Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''
        function()
          require("gitsigns").prev_hunk()
        end
      '';
      options = {
        desc = "Prev Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]H";
      action.__raw = ''
        function()
          require("gitsigns").nav_hunk("last")
        end
      '';
      options = {
        desc = "Last Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[H";
      action.__raw = ''
        function()
          require("gitsigns").nav_hunk("first")
        end
      '';
      options = {
        desc = "First Hunk";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ghs";
      action.__raw = ''
        function()
          require("gitsigns").stage_hunk()
        end
      '';
      options = {
        desc = "Stage Hunk";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ghr";
      action.__raw = ''
        function()
          require("gitsigns").reset_hunk()
        end
      '';
      options = {
        desc = "Reset Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action.__raw = ''
        function()
          require("gitsigns").stage_buffer()
        end
      '';
      options = {
        desc = "Stage Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action.__raw = ''
        function()
          require("gitsigns").reset_buffer()
        end
      '';
      options = {
        desc = "Reset Buffer";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action.__raw = ''
        function()
          require("gitsigns").undo_stage_hunk()
        end
      '';
      options = {
        desc = "Undo Stage Hunk";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action.__raw = ''
        function()
          require("gitsigns").preview_hunk_inline()
        end
      '';
      options = {
        desc = "Preview Hunk Inline";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action.__raw = ''
        function()
          require("gitsigns").diffthis()
        end
      '';
      options = {
        desc = "Diff This";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghD";
      action.__raw = ''
        function()
          require("gitsigns").diffthis("~")
        end
      '';
      options = {
        desc = "Diff This ~";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghb";
      action.__raw = ''
        function()
          require("gitsigns").blame_line({ full = true })
        end
      '';
      options = {
        desc = "Blame Line";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ghB";
      action.__raw = ''
        function()
          require("gitsigns").blame()
        end
      '';
      options = {
        desc = "Blame Buffer";
        silent = true;
      };
    }

    # ── snacks.git ────────────────────────────────────────────────────────────
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
          Snacks.picker.git_diff({ cwd = Snacks.git.get_root(), diff_base = "origin" })
        end
      '';
      options.desc = "Git Diff (origin)";
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
      key = "<leader>gl";
      action.__raw = ''
        function()
          Snacks.picker.git_log({ cwd = Snacks.git.get_root() })
        end
      '';
      options.desc = "Git Log";
    }
    {
      mode = "n";
      key = "<leader>gL";
      action = "<cmd>lua Snacks.picker.git_log()<cr>";
      options.desc = "Git Log (cwd)";
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua Snacks.picker.git_log_line()<cr>";
      options.desc = "Git Blame Line";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>lua Snacks.picker.git_log_file()<cr>";
      options.desc = "Git Current File History";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gB";
      action.__raw = ''
        function()
          Snacks.gitbrowse()
        end
      '';
      options.desc = "Git Browse (open)";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>gY";
      action.__raw = ''
        function()
          Snacks.gitbrowse({
            open = function(url)
              vim.fn.setreg("+", url)
            end,
            notify = false,
          })
        end
      '';
      options.desc = "Git Browse (copy)";
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
  ];
}
