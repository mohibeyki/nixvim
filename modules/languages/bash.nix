_: {
  languages.config.bash = {
    filetypes = [
      "sh"
      "bash"
    ];
    lsp = "bashls";
    formatter = "shfmt";
    treesitter = "bash";
    linters = "shellcheck";
  };
}
