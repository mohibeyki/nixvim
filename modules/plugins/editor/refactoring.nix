{
  plugins.refactoring = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>rb";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Block")
        end
      '';
      options = {
        desc = "Extract Block";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rB";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Block To File")
        end
      '';
      options = {
        desc = "Extract Block To File";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rf";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function")
        end
      '';
      options = {
        desc = "Extract Function";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rF";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function To File")
        end
      '';
      options = {
        desc = "Extract Function To File";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>rv";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Variable")
        end
      '';
      options = {
        desc = "Extract Variable";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ri";
      action.__raw = ''
        function()
          require("refactoring").refactor("Inline Variable")
        end
      '';
      options = {
        desc = "Inline Variable";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rp";
      action.__raw = ''
        function()
          require("refactoring").debug.printf({ below = false })
        end
      '';
      options = {
        desc = "Debug Print Below";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rP";
      action.__raw = ''
        function()
          require("refactoring").debug.printf({ below = true })
        end
      '';
      options = {
        desc = "Debug Print Above";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rV";
      action.__raw = ''
        function()
          require("refactoring").debug.print_var({ below = false })
        end
      '';
      options = {
        desc = "Debug Print Variable Below";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>rc";
      action.__raw = ''
        function()
          require("refactoring").debug.cleanup({})
        end
      '';
      options = {
        desc = "Cleanup Debug Prints";
        silent = true;
      };
    }
  ];
}
