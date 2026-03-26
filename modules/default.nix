{ config, lib, ... }:
{
  imports = [
    ./autocommands.nix
    ./keys.nix
    ./sets.nix

    ./plugins/colorscheme/colorscheme.nix

    ./plugins/completion/cmp.nix
    ./plugins/completion/copilot-cmp.nix
    ./plugins/completion/lspkind.nix

    ./plugins/git/gitblame.nix
    ./plugins/git/gitsigns.nix
    ./plugins/git/lazygit.nix

    ./plugins/lsp/conform.nix
    ./plugins/lsp/fidget.nix
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/lspsaga.nix
    ./plugins/lsp/none-ls.nix
    ./plugins/lsp/trouble.nix

    ./plugins/mini

    ./plugins/snippets/luasnip.nix

    ./plugins/treesitter/treesitter-context.nix
    ./plugins/treesitter/treesitter-textobjects.nix
    ./plugins/treesitter/treesitter.nix

    ./plugins/ui/bufferline.nix
    ./plugins/ui/dressing.nix
    ./plugins/ui/indent-blankline.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/nvim-notify.nix
    ./plugins/ui/smart-splits.nix
    ./plugins/ui/telescope.nix

    ./plugins/utils/comment.nix
    ./plugins/utils/comment-box.nix
    ./plugins/utils/flash.nix
    ./plugins/utils/illuminate.nix
    ./plugins/utils/markview.nix
    ./plugins/utils/oil.nix
    ./plugins/utils/spectre.nix
    ./plugins/utils/ufo.nix
    ./plugins/utils/undotree.nix
    ./plugins/utils/whichkey.nix
  ];

  options = {
    theme = lib.mkOption {
      default = lib.mkDefault "tokyonight";
      type = lib.types.enum [
        "paradise"
        "decay"
        "edge-dark"
        "mountain"
        "tokyonight"
        "everforest"
        "everblush"
        "jellybeans"
        "aquarium"
        "gruvbox"
        "oxocarbon"
        "rose-pine"
      ];
    };
  };

  config = {
    theme = "rose-pine";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
