{ config, lib, ... }:
let
  enabledWithFormatters = lib.filterAttrs (_: v: v.formatter != null) config.languages.enabledConfigs;

  formattersByFt = lib.foldlAttrs (
    acc: _name: cfg:
    let
      formatters = if lib.isList cfg.formatter then cfg.formatter else [ cfg.formatter ];
    in
    acc // lib.genAttrs cfg.filetypes (_: formatters)
  ) { } enabledWithFormatters;
in
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save.__raw = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      '';
      notify_on_error = true;
      formatters_by_ft = formattersByFt;
    };
  };
}
