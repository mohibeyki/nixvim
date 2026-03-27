{
  plugins.todo-comments = {
    enable = true;
    settings = { };
  };

  keymaps = [
    {
      mode = "n";
      key = "]t";
      action.__raw = ''
        function()
          require("todo-comments").jump_next()
        end
      '';
      options = {
        desc = "Next Todo Comment";
      };
    }
    {
      mode = "n";
      key = "[t";
      action.__raw = ''
        function()
          require("todo-comments").jump_prev()
        end
      '';
      options = {
        desc = "Previous Todo Comment";
      };
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      options = {
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
      options = {
        desc = "Todo/Fix/Fixme (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>st";
      action.__raw = ''
        function()
          require("snacks").picker.todo()
        end
      '';
      options = {
        desc = "Todo";
      };
    }
  ];
}
