{ config, lib, ... }:
let
  # Get enabled language configs that have formatters
  enabledWithFormatters = lib.filterAttrs (_: v: v.formatter != null) config.languages.enabledConfigs;

  # Build formatters_by_ft from language configs
  formattersByFt = lib.mapAttrs' (
    name: cfg:
    let
      firstFiletype = lib.head cfg.filetypes;
      formatters = if lib.isList cfg.formatter then cfg.formatter else [ cfg.formatter ];
    in
    lib.nameValuePair firstFiletype formatters
  ) enabledWithFormatters;
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

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>cF";
      action = ''<cmd>lua require("conform").format({ formatters = { "injected" } })<cr>'';
      options.desc = "Format Injected Langs";
    }
  ];
}
