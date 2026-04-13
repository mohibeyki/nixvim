{ lib, config, ... }:
let
  cfg = config.languages;
in
{
  options.languages = {
    enabled = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "List of enabled languages";
    };

    config = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            filetypes = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
            };
            lsp = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
            };
            formatter = lib.mkOption {
              type = lib.types.nullOr (lib.types.either lib.types.str (lib.types.listOf lib.types.str));
              default = null;
            };
            treesitter = lib.mkOption {
              type = lib.types.nullOr (lib.types.either lib.types.str (lib.types.listOf lib.types.str));
              default = null;
            };
            linters = lib.mkOption {
              type = lib.types.nullOr (lib.types.either lib.types.str (lib.types.listOf lib.types.str));
              default = null;
              description = "Linters to use for this language (null = no linters)";
            };
            lspSettings = lib.mkOption {
              type = lib.types.attrs;
              default = { };
              description = "Extra settings merged into plugins.lsp.servers.<name> for this language";
            };
          };
        }
      );
      default = { };
    };

    # Helper to get enabled language configs
    enabledConfigs = lib.mkOption {
      type = lib.types.attrs;
      internal = true;
      default = lib.filterAttrs (name: _: lib.elem name cfg.enabled) cfg.config;
    };
  };

  config.languages = {
    config = {
      nix = {
        filetypes = [ "nix" ];
        lsp = "nixd";
        formatter = "nixfmt";
        treesitter = "nix";
        linters = "statix";
      };

      lua = {
        filetypes = [ "lua" ];
        lsp = "lua_ls";
        formatter = "stylua";
        treesitter = "lua";
        linters = "luacheck";
      };

      python = {
        filetypes = [ "python" ];
        lsp = "pyright";
        formatter = "black";
        treesitter = "python";
        linters = [
          "ruff"
          "pylint"
        ];
      };

      go = {
        filetypes = [ "go" ];
        lsp = "gopls";
        formatter = [
          "gofmt"
          "goimports"
        ];
        treesitter = "go";
        linters = "golangci-lint";
      };

      typescript = {
        filetypes = [
          "typescript"
          "typescriptreact"
          "javascript"
          "javascriptreact"
        ];
        lsp = "vtsls";
        formatter = [
          "prettierd"
          "prettier"
        ];
        treesitter = [
          "typescript"
          "tsx"
          "javascript"
        ];
        linters = "eslint";
      };

      rust = {
        filetypes = [ "rust" ];
        lsp = "rust_analyzer";
        formatter = "rustfmt";
        treesitter = "rust";
        linters = "clippy";
        lspSettings = {
          installCargo = false;
          installRustc = false;
        };
      };

      json = {
        filetypes = [
          "json"
          "jsonc"
        ];
        lsp = "jsonls";
        formatter = "jq";
        treesitter = "json";
        linters = null;
      };

      bash = {
        filetypes = [
          "sh"
          "bash"
          "zsh"
        ];
        lsp = "bashls";
        formatter = "shfmt";
        treesitter = "bash";
        linters = "shellcheck";
      };

      markdown = {
        filetypes = [
          "markdown"
          "md"
        ];
        lsp = "marksman";
        formatter = [
          "prettierd"
          "prettier"
        ];
        treesitter = "markdown";
        linters = "markdownlint";
      };

      yaml = {
        filetypes = [
          "yaml"
          "yml"
        ];
        lsp = "yamlls";
        formatter = "yamlfmt";
        treesitter = "yaml";
        linters = "yamllint";
      };

      c = {
        filetypes = [
          "c"
          "cc"
          "cpp"
          "cxx"
          "h"
          "hh"
          "hpp"
        ];
        lsp = "clangd";
        formatter = "clang_format";
        treesitter = [
          "c"
          "cpp"
        ];
        linters = [
          "cpplint"
          "clangtidy"
        ];
      };
    };

    enabled = [
      "bash"
      "c"
      "go"
      "json"
      "lua"
      "markdown"
      "nix"
      "python"
      "rust"
      "typescript"
      "yaml"
    ];
  };
}
