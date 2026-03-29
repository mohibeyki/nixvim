{
  globals.mapleader = " ";

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<Down>";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        desc = "Down";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<Up>";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        desc = "Up";
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "i"
        "n"
        "s"
      ];
      key = "<Esc>";
      action.__raw = ''
        function()
          vim.cmd("noh")
          if vim.snippet and vim.snippet.active and vim.snippet.active({ direction = 1 }) then
            pcall(vim.snippet.stop)
          end
          return "<Esc>"
        end
      '';
      options = {
        desc = "Escape and Clear hlsearch";
        expr = true;
      };
    }
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
        desc = "Save File";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>qa<cr>";
      options = {
        desc = "Quit All";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ur";
      action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
      options.desc = "Redraw / Clear hlsearch / Diff Update";
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "n";
      action = "'Nn'[v:searchforward].(mode() ==# 'n' ? 'zv' : '')";
      options = {
        desc = "Next Search Result";
        expr = true;
      };
    }
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "N";
      action = "'nN'[v:searchforward].(mode() ==# 'n' ? 'zv' : '')";
      options = {
        desc = "Prev Search Result";
        expr = true;
      };
    }
    {
      mode = "i";
      key = ",";
      action = ",<c-g>u";
    }
    {
      mode = "i";
      key = ".";
      action = ".<c-g>u";
    }
    {
      mode = "i";
      key = ";";
      action = ";<c-g>u";
    }
    {
      mode = "n";
      key = "<leader>K";
      action = "<cmd>norm! K<cr>";
      options.desc = "Keywordprg";
    }
    {
      mode = "x";
      key = "<";
      action = "<gv";
    }
    {
      mode = "x";
      key = ">";
      action = ">gv";
    }
    {
      mode = "n";
      key = "gco";
      action = "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Below";
    }
    {
      mode = "n";
      key = "gcO";
      action = "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>";
      options.desc = "Add Comment Above";
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options.desc = "New File";
    }
    {
      mode = "n";
      key = "]e";
      action.__raw = ''
        function()
          vim.diagnostic.jump({ count = vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
        end
      '';
      options.desc = "Next Error";
    }
    {
      mode = "n";
      key = "[e";
      action.__raw = ''
        function()
          vim.diagnostic.jump({ count = -vim.v.count1, severity = vim.diagnostic.severity.ERROR, float = true })
        end
      '';
      options.desc = "Prev Error";
    }
    {
      mode = "n";
      key = "]w";
      action.__raw = ''
        function()
          vim.diagnostic.jump({ count = vim.v.count1, severity = vim.diagnostic.severity.WARN, float = true })
        end
      '';
      options.desc = "Next Warning";
    }
    {
      mode = "n";
      key = "[w";
      action.__raw = ''
        function()
          vim.diagnostic.jump({ count = -vim.v.count1, severity = vim.diagnostic.severity.WARN, float = true })
        end
      '';
      options.desc = "Prev Warning";
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
      key = "<leader>ui";
      action = "<cmd>lua vim.show_pos()<cr>";
      options.desc = "Inspect Pos";
    }
    {
      mode = "n";
      key = "<leader>uI";
      action.__raw = ''
        function()
          vim.treesitter.inspect_tree()
          vim.api.nvim_input("I")
        end
      '';
      options.desc = "Inspect Tree";
    }
    {
      mode = "n";
      key = "<leader>fT";
      action = "<cmd>lua Snacks.terminal()<cr>";
      options.desc = "Terminal (cwd)";
    }
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = ''
        function()
          Snacks.terminal(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<c-/>";
      action.__raw = ''
        function()
          Snacks.terminal.focus(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<c-_>";
      action.__raw = ''
        function()
          Snacks.terminal.focus(nil, { cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options.desc = "which_key_ignore";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        desc = "Split Window Below";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        desc = "Split Window Right";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        desc = "Delete Window";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options.desc = "Last Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>o";
      action = "<cmd>tabonly<cr>";
      options.desc = "Close Other Tabs";
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options.desc = "First Tab";
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options.desc = "New Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options.desc = "Next Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options.desc = "Close Tab";
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options.desc = "Previous Tab";
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<cmd>resize +2<cr>";
      options.desc = "Increase Window Height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<cmd>resize -2<cr>";
      options.desc = "Decrease Window Height";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "<cmd>vertical resize -2<cr>";
      options.desc = "Decrease Window Width";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<cmd>vertical resize +2<cr>";
      options.desc = "Increase Window Width";
    }
    {
      mode = "n";
      key = "[b";
      action = "<cmd>bprevious<cr>";
      options.desc = "Prev Buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = "<cmd>bnext<cr>";
      options.desc = "Next Buffer";
    }
    {
      mode = "n";
      key = "<leader>`";
      action = "<cmd>e #<cr>";
      options.desc = "Switch to Other Buffer";
    }
  ];
}
