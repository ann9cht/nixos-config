{ inputs, pkgs, ... }:

{
  imports = [ inputs.serpantinum.nixosModules.default ];

  programs.serpantinum.enable = true;

  environment.systemPackages = with pkgs; [
    # pactl
    pulseaudio

    # Bảng nhớ tạm
    cliphist
    wl-clipboard

    # Lấy mã màu
    hyprpicker
  ];
}
