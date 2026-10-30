{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dust
    duf
    fd
    ripgrep
  ];

  programs = {
    eza.enable = true;

    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
  };
}
