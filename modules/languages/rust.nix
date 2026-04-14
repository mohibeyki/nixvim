_: {
  languages.config.rust = {
    filetypes = [ "rust" ];
    lsp = "rust_analyzer";
    formatter = "rustfmt";
    treesitter = "rust";
    linters = "clippy";
    lspSettings = {
      installCargo = false;
      installRustc = false;
    };
  };
}
