{ config, lib, ... }:
{
  plugins.trouble = {
    enable = true;
    settings = {
      auto_open = true;
      auto_close = true;
      auto_preview = true;
      use_diagnostic_signs = true;
    };
  };
}
