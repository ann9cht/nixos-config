{ inputs, pkgs, ... }:
{
  imports = [ inputs.serpantinum.nixosModules.default ];

  programs = {
    serpantinum.enable = true;
    ski.package = pkgs.ski;
  };

  environment.systemPackages = with pkgs; [
    pulseaudio # pactl

    # bảng nhớ tạm
    cliphist
    wl-clipboard

    evince # Xem trước pdf
  ];
}
