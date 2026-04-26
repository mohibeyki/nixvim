_: {
  languages.config.python = {
    filetypes = [ "python" ];
    lsp = "basedpyright";
    formatter = "black";
    treesitter = "python";
    linters = [
      "ruff"
      "pylint"
    ];
  };
}
