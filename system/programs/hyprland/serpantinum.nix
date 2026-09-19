{ pkgs, ... }:

{
  programs.serpantinum.enable = true;

  environment.systemPackages = with pkgs; [
    # Chụp màn hình (pactl)
    pulseaudio

    # Bảng nhớ tạm
    cliphist
    wl-clipboard

    # Lấy mã màu
    hyprpicker
  ];
}
