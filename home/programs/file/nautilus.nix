{ config, pkgs, ... }:

let
  home = config.home.homeDirectory;
in
{
  home.packages =
    with pkgs;
    [
      nautilus

      # Giải nén/nén
      file-roller
      p7zip
      unzip
      unrar
      zip

      libheif # Xem trước ảnh HEIC
      ffmpegthumbnailer # Xem trước video
      evince # Xem trước pdf
    ]
    ++ (with gst_all_1; [
      # Gstreamer
      gstreamer
      gst-plugins-base
      gst-plugins-good
      gst-plugins-bad
      gst-plugins-ugly
      gst-libav
    ]);

  xdg.userDirs = {
    enable = true;
    createDirectories = true; # Tự động tạo thư mục (nếu chưa có)
    desktop = "${home}/Desktop";
    documents = "${home}/Documents";
    download = "${home}/Downloads";
    music = "${home}/Music";
    pictures = "${home}/Pictures";
    publicShare = "${home}/Public";
    templates = "${home}/Templates";
    videos = "${home}/Videos";
  };
}
