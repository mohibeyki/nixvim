_: {
  languages.config.python = {
    filetypes = [ "python" ];
    lsp = "pyright";
    formatter = "black";
    treesitter = "python";
    linters = [
      "ruff"
      "pylint"
    ];
  };
}
