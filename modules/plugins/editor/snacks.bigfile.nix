{
  plugins.snacks = {
    enable = true;
    settings.bigfile = {
      enabled = true;
      size = 1.5 * 1024 * 1024; # 1.5 MB
      line_length = 1000;
    };
  };
}
