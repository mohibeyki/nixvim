{
  plugins.lazygit = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''
        function()
          Snacks.lazygit({ cwd = Snacks.git.get_root() })
        end
      '';
      options = {
        desc = "Lazygit (Root Dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>gG";
      action.__raw = ''
        function()
          Snacks.lazygit()
        end
      '';
      options = {
        desc = "Lazygit (cwd)";
      };
    }
  ];
}
