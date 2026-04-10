{
  plugins.markview = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>mp";
      action.__raw = ''
        function()
          require("markview").actions.toggle()
        end
      '';
      options = {
        desc = "Toggle Markdown Preview";
        silent = true;
      };
    }
  ];
}
