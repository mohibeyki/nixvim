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
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notify_on_error = true;
      formatters_by_ft = formattersByFt;
    };
  };
}
