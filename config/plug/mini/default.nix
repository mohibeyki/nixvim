{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
  };

  imports = [
    ./ai.nix
    ./align.nix
    ./clue.nix
    ./diff.nix
    ./hipatterns.nix
    ./icons.nix
    ./indentscope.nix
    ./notify.nix
    ./sessions.nix
    ./starter.nix
    ./surround.nix
  ];
}
