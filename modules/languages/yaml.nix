_: {
  languages.config.yaml = {
    filetypes = [
      "yaml"
      "yml"
    ];
    lsp = "yamlls";
    formatter = "yamlfmt";
    treesitter = "yaml";
    linters = "yamllint";
  };
}
