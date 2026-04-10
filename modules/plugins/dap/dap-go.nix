{
  config,
  lib,
  ...
}:
lib.mkIf (lib.elem "go" config.languages.enabled) {
  plugins.dap-go = {
    enable = true;
  };
}
