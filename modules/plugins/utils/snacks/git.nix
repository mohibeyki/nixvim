{
  keymaps = [
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua Snacks.picker.github_issues()<CR>";
      options.desc = "GitHub Issues (open)";
    }
    {
      mode = "n";
      key = "<leader>gI";
      action.__raw = ''
        function()
          Snacks.picker.github_issues({ state = "all" })
        end
      '';
      options.desc = "GitHub Issues (all)";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua Snacks.picker.github_prs()<CR>";
      options.desc = "GitHub Pull Requests (open)";
    }
    {
      mode = "n";
      key = "<leader>gP";
      action.__raw = ''
        function()
          Snacks.picker.github_prs({ state = "all" })
        end
      '';
      options.desc = "GitHub Pull Requests (all)";
    }
  ];
}
