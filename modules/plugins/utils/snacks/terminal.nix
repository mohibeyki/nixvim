{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = ''
        function()
          Snacks.terminal.toggle()
        end
      '';
      options.desc = "Terminal (Root Dir)";
    }
    {
      mode = "n";
      key = "<leader>fT";
      action.__raw = ''
        function()
          Snacks.terminal.toggle({ cwd = vim.fn.expand("%:p:h") })
        end
      '';
      options.desc = "Terminal (cwd)";
    }
  ];
}
