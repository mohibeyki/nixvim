_: {
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "ministarter"
            "snacks_dashboard"
          ];
        };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [
          # Root directory
          {
            __unkeyed.__raw = ''
              function()
                local root = Snacks.git.get_root() or vim.fn.getcwd()
                return vim.fn.fnamemodify(root, ":t")
              end
            '';
            color.__raw = ''function() return { fg = Snacks.util.color("Constant") } end'';
          }
          {
            __unkeyed = "diagnostics";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };
          }
          {
            __unkeyed = "filetype";
            icon_only = true;
            separator = "";
            padding = { left = 1; right = 0; };
          }
          # Pretty path
          {
            __unkeyed.__raw = ''
              function()
                local path = vim.fn.expand("%:p")
                if path == "" then
                  return ""
                end
                local root = Snacks.git.get_root() or vim.fn.getcwd()
                local relative = vim.fn.fnamemodify(path, ":~:.")
                if relative:sub(1, 1) == "~" then
                  relative = vim.fn.fnamemodify(path, ":~")
                end
                return relative
              end
            '';
            symbols = {
              modified = " ";
              readonly = " ";
              unnamed = "";
            };
          }
        ];
        lualine_x = [
          # Snacks profiler status
          {
            __unkeyed.__raw = ''function() return Snacks.profiler.status() end'';
            cond.__raw = ''function() return Snacks.profiler.status() ~= "" end'';
          }
          # noice command status
          {
            __unkeyed.__raw = ''function() return require("noice").api.status.command.get() end'';
            cond.__raw = ''function() return package.loaded["noice"] and require("noice").api.status.command.has() end'';
            color.__raw = ''function() return { fg = Snacks.util.color("Statement") } end'';
          }
          # noice mode status (macro recording etc.)
          {
            __unkeyed.__raw = ''function() return require("noice").api.status.mode.get() end'';
            cond.__raw = ''function() return package.loaded["noice"] and require("noice").api.status.mode.has() end'';
            color.__raw = ''function() return { fg = Snacks.util.color("Constant") } end'';
          }
          # DAP status
          {
            __unkeyed.__raw = ''function() return "  " .. require("dap").status() end'';
            cond.__raw = ''function() return package.loaded["dap"] and require("dap").status() ~= "" end'';
            color.__raw = ''function() return { fg = Snacks.util.color("Debug") } end'';
          }
          # diff
          {
            __unkeyed = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
            source.__raw = ''
              function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end
            '';
          }
        ];
        lualine_y = [
          {
            __unkeyed = "progress";
            separator = " ";
            padding = { left = 1; right = 0; };
          }
          {
            __unkeyed = "location";
            padding = { left = 0; right = 1; };
          }
        ];
        lualine_z = [
          {
            __unkeyed.__raw = ''function() return "  " .. os.date("%R") end'';
          }
        ];
      };
      extensions = [ "lazy" "fzf" ];
    };
  };
}
