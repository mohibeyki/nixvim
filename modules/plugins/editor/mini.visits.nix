{
  plugins.mini = {
    enable = true;
    modules.visits = {
      store = {
        path.__raw = ''vim.fn.stdpath("data") .. "/mini-visits"'';
      };
    };
  };

  extraConfigLua = ''
    require("mini.visits").setup()
  '';
}
