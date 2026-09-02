{ pkgs, ... }:

{
  imports = [
    ./obsidian.nix
  ];

  home.packages = with pkgs; [ onlyoffice-desktopeditors ];
}