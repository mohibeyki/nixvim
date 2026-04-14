_: {
  languages.config.nix = {
    filetypes = [ "nix" ];
    lsp = "nixd";
    formatter = "nixfmt";
    treesitter = "nix";
    linters = "statix";
  };
}
