{
  config,
  lib,
  ...
}:
lib.mkIf (lib.elem "python" config.languages.enabled) {
  plugins.dap-python = {
    enable = true;

    settings = {
      console = "integratedTerminal";
      pythonPath = null;
      justMyCode = false;
      subProcess = false;
    };
  };
}
