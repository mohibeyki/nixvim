_: {
  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>oa";
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      options.desc = "Ask OpenCode";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ox";
      action.__raw = ''function() require("opencode").select() end'';
      options.desc = "Execute OpenCode Action";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<leader>ot";
      action.__raw = ''function() require("opencode").toggle() end'';
      options.desc = "Toggle OpenCode";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "go";
      action.__raw = ''function() return require("opencode").operator("@this ") end'';
      options = {
        silent = true;
        desc = "Add Range to OpenCode";
        expr = true;
      };
    }
    {
      mode = "n";
      key = "goo";
      action.__raw = ''function() return require("opencode").operator("@this ") .. "_" end'';
      options = {
        silent = true;
        desc = "Add Line to OpenCode";
        expr = true;
      };
    }
  ];
}
