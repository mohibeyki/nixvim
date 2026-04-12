{
  plugins.dressing = {
    enable = true;
    settings = {
      input = {
        enabled = true;
        default_prompt = "➤ ";
        trim_prompt = true;
        title_pos = "center";
        insert_only = true;
        start_in_insert = true;
        border = "rounded";
        relative = "cursor";
        prefer_width = 40;
        width = null;
        max_width = [
          140
          0.9
        ];
        min_width = [
          20
          0.2
        ];
        buf_options = { };
        win_options = {
          wrap = false;
          list = true;
          listchars = "precedes:…,extends:…";
          sidescrolloff = 0;
        };
        mappings = {
          n = {
            "<Esc>" = "Close";
            "<CR>" = "Confirm";
          };
          i = {
            "<C-c>" = "Close";
            "<CR>" = "Confirm";
            "<Up>" = "HistoryPrev";
            "<Down>" = "HistoryNext";
          };
        };
      };
      select = {
        enabled = true;
        backend = [
          "telescope"
          "fzf_lua"
          "builtin"
          "nui"
        ];
        trim_prompt = true;
        telescope = null;
        fzf_lua = {
          winopts = {
            height = 0.5;
            width = 0.5;
          };
        };
        nui = {
          position = "50%";
          size = null;
          relative = "editor";
          border = {
            style = "rounded";
          };
          buf_options = {
            swapfile = false;
            filetype = "DressingSelect";
          };
          win_options = {
            winblend = 10;
          };
          max_width = 80;
          max_height = 40;
          min_width = 40;
          min_height = 10;
        };
        builtin = {
          border = "rounded";
          relative = "editor";
          win_options = {
            winblend = 10;
            cursorline = true;
            cursorlineopt = "both";
          };
          width = null;
          max_width = [
            140
            0.8
          ];
          min_width = [
            40
            0.2
          ];
          height = null;
          max_height = 0.9;
          min_height = 0.2;
          mappings = {
            "<Esc>" = "Close";
            "<C-c>" = "Close";
            "<CR>" = "Confirm";
          };
        };
        format_item_override = { };
        get_config = null;
      };
    };
  };
}
