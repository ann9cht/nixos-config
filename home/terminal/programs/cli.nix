{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      dust
      duf
      fd
      ripgrep
    ];

    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
  };

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
