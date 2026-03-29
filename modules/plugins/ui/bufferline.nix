{ lib, config, ... }:
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separator_style = "thin";
        };
      };
    };
  };

  keymaps = lib.mkIf config.plugins.bufferline.enable [
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }

    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Prev Buffer";
      };
    }
    {
      mode = "n";
      key = "[B";
      action = "<cmd>BufferLineMovePrev<cr>";
      options = {
        desc = "Move buffer prev";
      };
    }
    {
      mode = "n";
      key = "]B";
      action = "<cmd>BufferLineMoveNext<cr>";
      options = {
        desc = "Move buffer next";
      };
    }

    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>:bd<cr>";
      options = {
        desc = "Delete Buffer and Window";
      };
    }

    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>e #<cr>";
      options = {
        desc = "Switch to Other Buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>bj";
      action = "<cmd>BufferLinePick<cr>";
      options = {
        desc = "Pick Buffer";
      };
    }
  ];
}
