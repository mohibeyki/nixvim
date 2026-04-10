{ config, lib, ... }:
{
  keymaps =
    # ── bufferline (conditional on plugin being enabled) ──────────────────────
    lib.optionals config.plugins.bufferline.enable [
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<CR>";
        options = {
          desc = "Next Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<CR>";
        options = {
          desc = "Prev Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "[B";
        action = "<cmd>BufferLineMovePrev<CR>";
        options = {
          desc = "Move Buffer Left";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "]B";
        action = "<cmd>BufferLineMoveNext<CR>";
        options = {
          desc = "Move Buffer Right";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bd";
        action.__raw = ''
          function()
            Snacks.bufdelete()
          end
        '';
        options = {
          desc = "Delete Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bD";
        action = "<cmd>:bd<CR>";
        options = {
          desc = "Delete Buffer and Window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>e #<CR>";
        options = {
          desc = "Switch to Other Buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>br";
        action = "<cmd>BufferLineCloseRight<CR>";
        options = {
          desc = "Delete Buffers to the Right";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bl";
        action = "<cmd>BufferLineCloseLeft<CR>";
        options = {
          desc = "Delete Buffers to the Left";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bo";
        action = "<cmd>BufferLineCloseOthers<CR>";
        options = {
          desc = "Delete Other Buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>BufferLineTogglePin<CR>";
        options = {
          desc = "Toggle Pin";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bP";
        action = "<cmd>BufferLineGroupClose ungrouped<CR>";
        options = {
          desc = "Delete Non-Pinned Buffers";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>bj";
        action = "<cmd>BufferLinePick<CR>";
        options = {
          desc = "Pick Buffer";
          silent = true;
        };
      }
    ]
    # ── noice ─────────────────────────────────────────────────────────────────
    ++ [
      {
        mode = "n";
        key = "<leader>n";
        action = ''<cmd>lua require("noice").cmd("history")<cr>'';
        options.desc = "Notification History";
      }
      {
        mode = "n";
        key = "<leader>un";
        action = ''<cmd>lua require("noice").cmd("dismiss")<cr>'';
        options.desc = "Dismiss All Notifications";
      }
      {
        mode = "n";
        key = "<leader>sn";
        action = "";
        options.desc = "+noice";
      }
      {
        mode = "c";
        key = "<S-Enter>";
        action = ''<cmd>lua require("noice").redirect(vim.fn.getcmdline())<cr>'';
        options.desc = "Redirect Cmdline";
      }
      {
        mode = "n";
        key = "<leader>snl";
        action = ''<cmd>lua require("noice").cmd("last")<cr>'';
        options.desc = "Noice Last Message";
      }
      {
        mode = "n";
        key = "<leader>snh";
        action = ''<cmd>lua require("noice").cmd("history")<cr>'';
        options.desc = "Noice History";
      }
      {
        mode = "n";
        key = "<leader>sna";
        action = ''<cmd>lua require("noice").cmd("all")<cr>'';
        options.desc = "Noice All";
      }
      {
        mode = "n";
        key = "<leader>snd";
        action = ''<cmd>lua require("noice").cmd("dismiss")<cr>'';
        options.desc = "Dismiss All";
      }
      {
        mode = "n";
        key = "<leader>snt";
        action = ''<cmd>lua require("noice").cmd("pick")<cr>'';
        options.desc = "Noice Picker";
      }
      {
        mode = [
          "i"
          "n"
          "s"
        ];
        key = "<C-f>";
        action.__raw = ''
          function()
            if not require("noice.lsp").scroll(4) then
              return "<C-f>"
            end
          end
        '';
        options = {
          desc = "Scroll Forward";
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
        key = "<C-b>";
        action.__raw = ''
          function()
            if not require("noice.lsp").scroll(-4) then
              return "<C-b>"
            end
          end
        '';
        options = {
          desc = "Scroll Backward";
          expr = true;
          silent = true;
        };
      }

      # ── inspect / redraw ──────────────────────────────────────────────────
      {
        mode = "n";
        key = "<leader>ur";
        action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
        options.desc = "Redraw / Clear hlsearch / Diff Update";
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
        key = "<leader>uC";
        action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
        options.desc = "Colorschemes";
      }

      # ── smart-splits ──────────────────────────────────────────────────────
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = ''require("smart-splits").move_cursor_left'';
        options = {
          desc = "Go to Left Window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = ''require("smart-splits").move_cursor_down'';
        options = {
          desc = "Go to Lower Window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = ''require("smart-splits").move_cursor_up'';
        options = {
          desc = "Go to Upper Window";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = ''require("smart-splits").move_cursor_right'';
        options = {
          desc = "Go to Right Window";
          silent = true;
        };
      }
    ];
}
