{ config, lib, ... }:
let
  # Get enabled language configs
  enabledLangs = config.languages.enabledConfigs;

  # Get list of LSP servers to enable (filtering out nulls)
  lspServers = lib.filterAttrs (_: v: v.lsp != null) enabledLangs;
in
{
  plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      # Enable servers based on language config
      # Then override specific ones that need extra configuration
      lua_ls.enable = lib.elem "lua" config.languages.enabled;
      marksman.enable = lib.elem "markdown" config.languages.enabled;
      pyright.enable = lib.elem "python" config.languages.enabled;
      gopls.enable = lib.elem "go" config.languages.enabled;
      yamlls.enable = lib.elem "yaml" config.languages.enabled;
      clangd.enable = lib.elem "c" config.languages.enabled;

      # Complex server configs (manual overrides)
      nixd = lib.mkIf (lib.elem "nix" config.languages.enabled) {
        enable = true;
        extraOptions = {
          nixos.expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.aurelionite.options";
          home_manager.expr = "(builtins.getFlake \"/etc/nixos\").homeConfigurations.aurelionite.options";
        };
      };
    };

    keymaps = {
      silent = true;
      lspBuf = {
        "gd" = {
          action = "definition";
          desc = "Goto Definition";
        };
        "gr" = {
          action = "references";
          desc = "Goto References";
        };
        "gD" = {
          action = "declaration";
          desc = "Goto Declaration";
        };
        "gI" = {
          action = "implementation";
          desc = "Goto Implementation";
        };
        "gT" = {
          action = "type_definition";
          desc = "Type Definition";
        };
        "K" = {
          action = "hover";
          desc = "Hover";
        };
        "<leader>cr" = {
          action = "rename";
          desc = "Rename";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "Code Action";
        };
        "<leader>cw" = {
          action = "workspace_symbol";
          desc = "Workspace Symbol";
        };
      };
      diagnostic = {
        "<leader>cd" = {
          action = "open_float";
          desc = "Line Diagnostics";
        };
        "[d" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "]d" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ch";
      action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
      options = {
        desc = "Toggle Inlay Hints";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ci";
      action = "<cmd>lua vim.lsp.buf.incoming_calls()<CR>";
      options = {
        desc = "Incoming Calls";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>";
      options = {
        desc = "Outgoing LSP Calls";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        desc = "Format";
        silent = true;
      };
    }
  ];

  extraConfigLua = ''
    -- Rounded borders for LSP handlers (no nixvim option for this)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = "rounded" }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = "rounded" }
    )

    -- LSP progress autocmd for statusline (custom logic, must be Lua)
    vim.api.nvim_create_autocmd("LspProgress", {
      pattern = {"begin", "report", "end"},
      callback = function(args)
        vim.cmd("redrawstatus")
      end,
    })
  '';
}
