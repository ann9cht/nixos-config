{ inputs, pkgs, ... }:

{
  imports = [ inputs.serpantinum.nixosModules.default ];

  programs = {
    serpantinum.enable = true;
    ski.enable = false;
  };

  environment.systemPackages = with pkgs; [
    # pactl
    pulseaudio

    # bảng nhớ tạm
    cliphist
    wl-clipboard

    # lấy mã màu
    hyprpicker
  ];
}
