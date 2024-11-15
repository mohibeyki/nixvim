{ config, lib, ... }:
{
  imports = [
    ./autocommands.nix
    ./keys.nix
    ./sets.nix
    ./highlight.nix

    ./plug/colorscheme/colorscheme.nix

    ./plug/completion/cmp.nix
    ./plug/completion/copilot-cmp.nix
    ./plug/completion/lspkind.nix

    ./plug/git/gitblame.nix
    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/none-ls.nix
    ./plug/lsp/trouble.nix

    ./plug/mini

    ./plug/snippets/luasnip.nix

    ./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    ./plug/ui/bufferline.nix
    ./plug/ui/dressing.nix
    ./plug/ui/indent-blankline.nix
    ./plug/ui/lualine.nix
    ./plug/ui/noice.nix
    ./plug/ui/nvim-notify.nix
    ./plug/ui/smart-splits.nix
    ./plug/ui/telescope.nix

    ./plug/utils/comment.nix
    ./plug/utils/comment-box.nix
    ./plug/utils/flash.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/markview.nix
    ./plug/utils/oil.nix
    ./plug/utils/spectre.nix
    ./plug/utils/ufo.nix
    ./plug/utils/undotree.nix
    ./plug/utils/whichkey.nix
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
      ];
    };
    assistant = lib.mkOption {
      default = "copilot";
      type = lib.types.enum [
        "copilot"
        "none"
      ];
    };
  };
  config = {
    # The base16 theme to use
    theme = "tokyonight";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}
