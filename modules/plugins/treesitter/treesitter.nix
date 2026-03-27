{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.plugins.treesitter;

  # Get treesitter grammars from enabled languages (handles both string and list)
  enabledGrammars = lib.concatMap (
    v: if lib.isList v.treesitter then v.treesitter else [ v.treesitter ]
  ) (lib.attrValues (lib.filterAttrs (_: v: v.treesitter != null) config.languages.enabledConfigs));

  # If useAllGrammars is false, only install grammars for enabled languages
  # Otherwise use all grammars
  grammarPackages =
    if cfg.useAllGrammars then
      pkgs.vimPlugins.nvim-treesitter.allGrammars
    else
      lib.filter (pkg: lib.elem pkg.pname enabledGrammars) pkgs.vimPlugins.nvim-treesitter.allGrammars;
in
{
  options.plugins.treesitter.useAllGrammars = lib.mkOption {
    type = lib.types.bool;
    default = true;
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
