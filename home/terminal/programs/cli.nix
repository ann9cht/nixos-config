{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dust
    duf
    fd
    file
    ripgrep

    android-tools
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

  home.sessionVariables = {
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";
  };
}
