{ pkgs, ... }:
{
  programs.niri.enable = true;

  services.gnome.gnome-keyring.enable = false;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
  ];
}
