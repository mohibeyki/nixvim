_: {
  plugins.flash = {
    enable = true;
    settings = {
      modes = {
        char = {
          enabled = true;
          jump_labels = true;
        };
        search = {
          enabled = true;
        };
      };
      labels = "asdfghjklqwertyuiopzxcvbnm";
      label = {
        uppercase = false;
      };
    };
  };

  keymaps = [
    # Flash jump (remapped from s)
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "s";
      action.__raw = ''
        function()
          require("flash").jump()
        end
      '';
      options.desc = "Flash";
    }
    # Flash treesitter selection
    {
      mode = [
        "n"
        "x"
        "o"
      ];
      key = "S";
      action.__raw = ''
        function()
          require("flash").treesitter()
        end
      '';
      options.desc = "Flash Treesitter";
    }
    # Remote flash (operate on distant text)
    {
      mode = "o";
      key = "r";
      action.__raw = ''
        function()
          require("flash").remote()
        end
      '';
      options.desc = "Remote Flash";
    }
    # Treesitter search
    {
      mode = [
        "x"
        "o"
      ];
      key = "R";
      action.__raw = ''
        function()
          require("flash").treesitter_search()
        end
      '';
      options.desc = "Treesitter Search";
    }
    # Substitute moved to gs
    {
      mode = "n";
      key = "gs";
      action = "s";
      options.desc = "Substitute (was s)";
    }
    # Visual substitute moved to gs
    {
      mode = "x";
      key = "gs";
      action = "s";
      options.desc = "Substitute (was s)";
    }
  ];
}
