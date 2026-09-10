{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ cava ];

  xdg.configFile."cava/config".source = "${inputs.serpantinum}/config/cava/config_base";
}
