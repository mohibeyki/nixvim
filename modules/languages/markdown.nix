_: {
  languages.config.markdown = {
    filetypes = [
      "markdown"
      "md"
    ];
    lsp = "marksman";
    formatter = [
      "prettierd"
      "prettier"
    ];
    treesitter = "markdown";
    linters = "markdownlint";
  };
}
