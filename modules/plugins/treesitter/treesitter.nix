{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.plugins.treesitter;

  enabledGrammars = lib.concatMap (
    v: if lib.isList v.treesitter then v.treesitter else [ v.treesitter ]
  ) (lib.attrValues (lib.filterAttrs (_: v: v.treesitter != null) config.languages.enabledConfigs));

  grammarPackages =
    if cfg.useAllGrammars then
      pkgs.vimPlugins.nvim-treesitter.allGrammars
    else
      lib.filter (pkg: lib.elem pkg.pname enabledGrammars) pkgs.vimPlugins.nvim-treesitter.allGrammars;
in
{
  options.plugins.treesitter.useAllGrammars = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Install all treesitter grammars. If false, only installs grammars for enabled languages.";
  };

  config.plugins.treesitter = {
    enable = true;
    settings = {
      indent.enable = true;
      highlight.enable = true;
    };
    folding.enable = true;
    nixvimInjections = true;
    inherit grammarPackages;
  };
}
