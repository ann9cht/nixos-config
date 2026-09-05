{ pkgs, ... }:

{
  home.packages = with pkgs; [ nil ];

  programs.vscodium = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      sumneko.lua
    ];
  };
}
