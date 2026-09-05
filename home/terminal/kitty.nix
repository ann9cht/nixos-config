{ pkgs, inputs, ... }:

{
  home.packages = [ pkgs.kitty ];

  xdg.configFile."kitty/kitty.conf".source = "${inputs.serpantinum}/config/kitty/kitty.conf";
}
