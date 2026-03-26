{
  imports = [
    ./autocommands.nix
    ./keys.nix
    ./sets.nix

    ./plugins/colorscheme
    ./plugins/completion
    ./plugins/git
    ./plugins/lsp
    ./plugins/mini
    ./plugins/snippets
    ./plugins/treesitter
    ./plugins/ui
    ./plugins/utils
  ];
}
