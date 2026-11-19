{
  imports = [
    ./dux-files.nix
    ./dux-greeter.nix
    ./dux-search.nix
  ];

  programs.dux-shell.enable = true;
}
