_: {
  languages.config.go = {
    filetypes = [ "go" ];
    lsp = "gopls";
    formatter = [
      "gofmt"
      "goimports"
    ];
    treesitter = "go";
    linters = "golangcilint";
    lspSettings = {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true;
            shadow = true;
            nilness = true;
            unusedwrite = true;
          };
          hints = {
            assignVariableTypes = true;
            compositeLiteralFields = true;
            compositeLiteralTypes = true;
            constantValues = true;
            functionTypeParameters = true;
            parameterNames = true;
            rangeVariableTypes = true;
          };
        };
      };
    };
  };
}
