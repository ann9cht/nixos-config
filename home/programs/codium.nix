{ pkgs, ... }:

{
  home.packages = with pkgs; [ nixd ];

  programs.vscodium = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      sumneko.lua
    ];
    userSettings = {
      "terminal.integrated.copyOnSelection" = true;
    };
  };
}
