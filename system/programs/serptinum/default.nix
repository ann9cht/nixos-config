{ inputs, pkgs, ... }:

{
  imports = [
    inputs.serpantinum.nixosModules.default
    ./ski
  ];

  programs.serpantinum.enable = true;

  environment.systemPackages = with pkgs; [
    # pactl
    pulseaudio

    # bảng nhớ tạm
    cliphist
    wl-clipboard
  ];
}
