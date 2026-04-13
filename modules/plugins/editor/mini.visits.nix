{
  plugins.mini = {
    enable = true;
    modules.visits = {
      store = {
        path.__raw = ''vim.fn.stdpath("data") .. "/mini-visits"'';
      };
    };
  };
}
