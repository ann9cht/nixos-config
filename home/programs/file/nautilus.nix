{ config, pkgs, ... }:

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

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # Tự động tạo thư mục (nếu chưa có)
    desktop = "${config.home.homeDirectory}/Desktop";
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    music = "${config.home.homeDirectory}/Music";
    pictures = "${config.home.homeDirectory}/Pictures";
    publicShare = "${config.home.homeDirectory}/Public";
    templates = "${config.home.homeDirectory}/Templates";
    videos = "${config.home.homeDirectory}/Videos";
  };
}
