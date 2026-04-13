{
  config,
  lib,
  pkgs,
  ...
}:
let
  enabledWithTs = lib.filterAttrs (_: cfg: cfg.treesitter != null) config.languages.enabledConfigs;
  grammarNames = lib.concatMap (
    cfg: if lib.isList cfg.treesitter then cfg.treesitter else [ cfg.treesitter ]
  ) (lib.attrValues enabledWithTs);
  grammarPackages = map (name: pkgs.vimPlugins.nvim-treesitter.builtGrammars.${name}) grammarNames;
in
{
  plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    nixvimInjections = true;
    inherit grammarPackages;
  };
}
