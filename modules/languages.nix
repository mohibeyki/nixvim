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

  config.languages.enabled = [
    "bash"
    "c"
    "fish"
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
}
