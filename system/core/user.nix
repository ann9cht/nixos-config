{ pkgs, ... }:

{
  programs.fish.enable = true;

  users = {
    users = {
      "ann9cht" = {
        isNormalUser = true;
        description = "ann9cht";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.fish;
      };
      uinput_proxy = {
        isSystemUser = true;
        group = "uinput_proxy";
        description = "Fcitx5 Lotus uinput proxy user";
      };
    };
    groups.uinput_proxy = {};
  };
}