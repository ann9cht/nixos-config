{ pkgs, ... }:

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
      gstreamer
      gst-plugins-base
      gst-plugins-good
      gst-plugins-bad
      gst-plugins-ugly
      gst-libav
    ]);
}
