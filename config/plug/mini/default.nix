{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
  };

  imports = [
    ./ai.nix
    ./bufremove.nix
    ./comment.nix
    ./hipatterns.nix
    ./icons.nix
    ./indentscope.nix
    ./starter.nix
    ./sessions.nix
    ./surround.nix
  ];
}
