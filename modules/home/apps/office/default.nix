{ pkgs, ... }:
{
  imports = [
    ./obsidian.nix
  ];

  programs.libreoffice = {
    enable = true;
    package = pkgs.libreoffice;
  };
}
