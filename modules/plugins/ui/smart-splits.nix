{
  plugins.smart-splits.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = ":lua require('smart-splits').move_cursor_left()<CR>";
      options = {
        desc = "Go to Left Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = ":lua require('smart-splits').move_cursor_down()<CR>";
      options = {
        desc = "Go to Lower Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = ":lua require('smart-splits').move_cursor_up()<CR>";
      options = {
        desc = "Go to Upper Window";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = ":lua require('smart-splits').move_cursor_right()<CR>";
      options = {
        desc = "Go to Right Window";
        silent = true;
      };
    }
  ];
}
