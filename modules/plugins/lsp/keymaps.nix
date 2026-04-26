{
  config,
  lib,
  ...
}:
{
  keymaps = [
    # ── lsp (static) ──────────────────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>lua Snacks.picker.lsp_config()<CR>";
      options = {
        desc = "Lsp Info";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>cf";
      action.__raw = ''
        function()
          require("conform").format({ lsp_format = "fallback" })
        end
      '';
      options = {
        desc = "Format";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>cF";
      action = ''<cmd>lua require("conform").format({ formatters = { "injected" } })<cr>'';
      options = {
        desc = "Format Injected Langs";
        silent = true;
      };
    }
  ]
  # ── trouble (conditional on plugin being enabled) ─────────────────────────
  ++ lib.optionals config.plugins.trouble.enable [
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<CR>";
      options = {
        desc = "Diagnostics (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
      options = {
        desc = "Buffer Diagnostics (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle<CR>";
      options = {
        desc = "Symbols (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cS";
      action = "<cmd>Trouble lsp toggle<CR>";
      options = {
        desc = "LSP references/definitions/... (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<cmd>Trouble loclist toggle<CR>";
      options = {
        desc = "Location List (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<cmd>Trouble qflist toggle<CR>";
      options = {
        desc = "Quickfix List (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      options = {
        desc = "Todo (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
      options = {
        desc = "Todo/Fix/Fixme (Trouble)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[q";
      action.__raw = ''
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      options = {
        desc = "Previous Trouble/Quickfix Item";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]q";
      action.__raw = ''
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      options = {
        desc = "Next Trouble/Quickfix Item";
        silent = true;
      };
    }
  ];
}
