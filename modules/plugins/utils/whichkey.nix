{
  plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader><tab>";
          group = "+tabs";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "+buffer";
          expand.__raw = ''
            function()
              return require("which-key.extras").expand.buf()
            end
          '';
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "+code";
        }
        {
          __unkeyed-1 = "<leader>d";
          group = "+debug";
        }
        {
          __unkeyed-1 = "<leader>dp";
          group = "+profiler";
        }
        {
          __unkeyed-1 = "<leader>f";
          group = "+file/find";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "+git";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "+markdown";
        }
        {
          __unkeyed-1 = "<leader>v";
          group = "+visits";
        }
        {
          __unkeyed-1 = "[";
          group = "+prev";
        }
        {
          __unkeyed-1 = "]";
          group = "+next";
        }
        {
          __unkeyed-1 = "g";
          group = "+goto";
        }
        {
          __unkeyed-1 = "gs";
          group = "+surround";
        }
        {
          __unkeyed-1 = "<leader>q";
          group = "+quit/session";
        }
        {
          __unkeyed-1 = "<leader>r";
          group = "+refactor";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "+search";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "+ui";
        }
        {
          __unkeyed-1 = "<leader>w";
          group = "+windows";
          proxy = "<c-w>";
          expand.__raw = ''
            function()
              return require("which-key.extras").expand.win()
            end
          '';
        }
        {
          __unkeyed-1 = "<leader>x";
          group = "+diagnostics/quickfix";
        }
        {
          __unkeyed-1 = "z";
          group = "+fold";
        }
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>?";
      action = ''<cmd>lua require("which-key").show({ global = false })<cr>'';
      options.desc = "Buffer Keymaps (which-key)";
    }
    {
      mode = "n";
      key = "<c-w><space>";
      action = ''<cmd>lua require("which-key").show({ keys = "<c-w>", loop = true })<cr>'';
      options.desc = "Window Hydra Mode (which-key)";
    }
  ];
}
