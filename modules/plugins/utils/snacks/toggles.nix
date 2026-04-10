{
  keymaps = [
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options.desc = "Notification History";
    }
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
      options.desc = "Dismiss All Notifications";
    }
  ];

  extraConfigLua = ''
    Snacks.toggle.profiler():map("<leader>dpp")
    Snacks.toggle.profiler_highlights():map("<leader>dph")

    Snacks.toggle.new({
      id = "auto_format_global",
      name = "Auto Format (Global)",
      get = function()
        return not (vim.g.disable_autoformat or false)
      end,
      set = function(state)
        vim.g.disable_autoformat = not state
      end,
    }):map("<leader>uf")

    Snacks.toggle.new({
      id = "auto_format_buffer",
      name = "Auto Format (Buffer)",
      get = function()
        return not (vim.b.disable_autoformat or false)
      end,
      set = function(state)
        vim.b.disable_autoformat = not state
      end,
    }):map("<leader>uF")

    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
    Snacks.toggle.diagnostics():map("<leader>ud")
    Snacks.toggle.line_number():map("<leader>ul")
    Snacks.toggle.option("conceallevel", {
      off = 0,
      on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
      name = "Conceal Level",
    }):map("<leader>uc")
    Snacks.toggle.option("showtabline", {
      off = 0,
      on = vim.o.showtabline > 0 and vim.o.showtabline or 2,
      name = "Tabline",
    }):map("<leader>uA")
    Snacks.toggle.treesitter():map("<leader>uT")
    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
    Snacks.toggle.dim():map("<leader>uD")
    Snacks.toggle.animate():map("<leader>ua")
    Snacks.toggle.indent():map("<leader>ug")
    Snacks.toggle.scroll():map("<leader>uS")
    if vim.lsp.inlay_hint then
      Snacks.toggle.inlay_hints():map("<leader>uh")
    end
    Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
    Snacks.toggle.zen():map("<leader>uz")

    -- Auto-open Snacks explorer when starting Neovim with a directory argument
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname ~= "" and vim.fn.isdirectory(bufname) == 1 then
          -- It's a directory, open the explorer
          vim.schedule(function()
            Snacks.explorer.open({ cwd = bufname })
          end)
        end
      end,
      desc = "Auto-open Snacks explorer on directory",
    })
  '';
}
