{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;

    modules = {
      ai = {
        mappings = {
          around = "a";
          inside = "i";
          around_next = "an";
          inside_next = "in";
          around_last = "al";
          inside_last = "il";
          goto_left = "g[";
          goto_right = "g]";
        };
      };

      bracketed = { };

      hipatterns = {
        highlighters = {
          hex_color.__raw = ''
            require("mini.hipatterns").gen_highlighter.hex_color()
          '';
        };
      };

      icons = { };

      jump = {
        mappings = {
          forward = "s";
          backward = "S";
          forward_till = "";
          backward_till = "";
          repeat_jump = ";";
        };
      };

      move = {
        mappings = {
          left = "<M-h>";
          right = "<M-l>";
          down = "<M-j>";
          up = "<M-k>";
          line_left = "<M-h>";
          line_right = "<M-l>";
          line_down = "<M-j>";
          line_up = "<M-k>";
        };
      };

      surround = {
        mappings = {
          add = "gsa";
          delete = "gsd";
          find = "gsf";
          find_left = "gsF";
          highlight = "gsh";
          replace = "gsr";
          update_n_lines = "gsn";
        };
      };

      visits = {
        store = {
          path.__raw = ''vim.fn.stdpath("data") .. "/mini-visits"'';
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>vr";
      action.__raw = ''
        function()
          require("mini.visits").list_paths()
        end
      '';
      options = {
        desc = "Recent Locations (Visits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>vl";
      action.__raw = ''
        function()
          require("mini.visits").list_labels()
        end
      '';
      options = {
        desc = "Visit Labels";
        silent = true;
      };
    }
  ];

  extraConfigLua = ''
    -- mini.visits - track visited locations
    require("mini.visits").setup()

    -- Highlight yanked region briefly
    vim.api.nvim_create_autocmd("TextYankPost", {
      callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
      end,
    })
  '';
}
