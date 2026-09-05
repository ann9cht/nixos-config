{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ fastfetch ];

  xdg.configFile."fastfetch/config.jsonc".source =
    "${inputs.serpantinum}/config/fastfetch/config.jsonc";
}
