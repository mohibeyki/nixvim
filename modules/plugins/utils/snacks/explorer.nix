{
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = ''
        function()
          Snacks.explorer.open({ cwd = Snacks.git.get_root() or vim.fn.getcwd() })
        end
      '';
      options = {
        desc = "Explorer (root dir)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>E";
      action = "<cmd>lua Snacks.explorer.open()<CR>";
      options = {
        desc = "Explorer (cwd)";
        silent = true;
      };
    }
  ];
}
