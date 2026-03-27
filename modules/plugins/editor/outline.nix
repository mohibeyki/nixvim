{ pkgs, ... }:
{
  extraPlugins = [ pkgs.vimPlugins.outline-nvim ];

  extraConfigLua = ''
    require("outline").setup({})
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Outline<cr>";
      options = {
        desc = "Toggle Outline";
      };
    }
  ];
}
