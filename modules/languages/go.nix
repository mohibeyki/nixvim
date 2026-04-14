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
  };
}
