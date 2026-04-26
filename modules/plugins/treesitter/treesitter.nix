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
  grammarNamesUnique = lib.unique grammarNames;
in
{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
    grammarPackages = map (
      name: pkgs.vimPlugins.nvim-treesitter.builtGrammars.${name}
    ) grammarNamesUnique;
  };

  extraConfigLua = ''
    vim.treesitter.language.register("go", "gotmpl")
  '';
}
