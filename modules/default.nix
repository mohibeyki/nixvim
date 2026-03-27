{
  imports = [
    ./languages.nix

    ./autocommands.nix
    ./keys.nix
    ./options.nix

    ./plugins/coding
    ./plugins/colorscheme
    ./plugins/completion
    ./plugins/editor
    ./plugins/git
    ./plugins/linting
    ./plugins/lsp
    ./plugins/treesitter
    ./plugins/ui
    ./plugins/utils
  ];
}
