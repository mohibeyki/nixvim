{
  plugins.refactoring = {
    enable = true;
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>r";
      action = "+refactor";
      options = {
        desc = "+refactor";
      };
    }
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
      };
    }
    {
      mode = "x";
      key = "<leader>rf";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function")
        end
      '';
      options = {
        desc = "Extract Function";
      };
    }
    {
      mode = "x";
      key = "<leader>rF";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Function To File")
        end
      '';
      options = {
        desc = "Extract Function To File";
      };
    }
    {
      mode = "x";
      key = "<leader>rx";
      action.__raw = ''
        function()
          require("refactoring").refactor("Extract Variable")
        end
      '';
      options = {
        desc = "Extract Variable";
      };
    }
    {
      mode = "n";
      key = "<leader>ri";
      action.__raw = ''
        function()
          require("refactoring").refactor("Inline Variable")
        end
      '';
      options = {
        desc = "Inline Variable";
      };
    }
    {
      mode = "x";
      key = "<leader>ri";
      action.__raw = ''
        function()
          require("refactoring").refactor("Inline Variable")
        end
      '';
      options = {
        desc = "Inline Variable";
      };
    }
  ];
}
