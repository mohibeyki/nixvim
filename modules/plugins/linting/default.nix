{ config, lib, ... }:
let
  # Get enabled language configs that have linters
  enabledWithLinters = lib.filterAttrs (_: v: v.linters != null) config.languages.enabledConfigs;

  # Build lintersByFt from language configs
  lintersByFt = lib.mapAttrs' (
    name: cfg:
    let
      firstFiletype = lib.head cfg.filetypes;
      linters = if lib.isList cfg.linters then cfg.linters else [ cfg.linters ];
    in
    lib.nameValuePair firstFiletype linters
  ) enabledWithLinters;
in
{
  plugins.lint = {
    enable = true;

    # Auto-generated from languages.nix
    lintersByFt = lintersByFt;
  };
}
