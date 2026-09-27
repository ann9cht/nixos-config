{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libglvnd
      stdenv.cc.cc.lib
    ];
  };
}
