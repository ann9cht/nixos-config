{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nautilus

    # Giải nén
    file-roller
    p7zip
    unzip
    unrar

    libheif # Xem trước ảnh HEIC
    ffmpegthumbnailer # Xem trước video
    evince # Xem trước pdf

    # Gstreamer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };
}