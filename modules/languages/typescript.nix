_: {
  languages.config.typescript = {
    filetypes = [
      "typescript"
      "typescriptreact"
      "javascript"
      "javascriptreact"
    ];
    lsp = "vtsls";
    formatter = [
      "prettierd"
      "prettier"
    ];
    treesitter = [
      "typescript"
      "tsx"
      "javascript"
    ];
    linters = "eslint";
  };
}
