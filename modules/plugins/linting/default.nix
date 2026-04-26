{
  config,
  lib,
  ...
}:
let
  enabledWithLinters = lib.filterAttrs (_: v: v.linters != null) config.languages.enabledConfigs;
  lintersByFt = lib.foldlAttrs (
    acc: _name: cfg:
    let
      linters = if lib.isList cfg.linters then cfg.linters else [ cfg.linters ];
    in
    acc // lib.genAttrs cfg.filetypes (_: linters)
  ) { } enabledWithLinters;
in
{
  plugins.lint = {
    enable = true;
    inherit lintersByFt;
  };
}
