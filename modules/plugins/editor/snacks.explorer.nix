_: {
  plugins.snacks.settings.explorer.enabled = true;

  extraConfigLua = ''
    -- Auto-open Snacks explorer when starting Neovim with a directory argument
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname ~= "" and vim.fn.isdirectory(bufname) == 1 then
          vim.schedule(function()
            Snacks.explorer.open({ cwd = bufname })
          end)
        end
      end,
      desc = "Auto-open Snacks explorer on directory",
    })
  '';
}
