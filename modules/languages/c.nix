_: {
  languages.config.c = {
    filetypes = [
      "c"
      "cc"
      "cpp"
      "cxx"
      "h"
      "hh"
      "hpp"
    ];
    lsp = "clangd";
    formatter = "clang_format";
    treesitter = [
      "c"
      "cpp"
    ];
    linters = [
      "cpplint"
      "clangtidy"
    ];
  };
}
