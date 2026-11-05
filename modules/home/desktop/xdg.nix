{ lib, config, ... }:
let
  apps = {
    browser = "zen-beta.desktop";
    imageViewer = "org.gnome.Loupe.desktop";
    mediaPlayer = "mpv.desktop";
    pdfViewer = "org.gnome.Evince.desktop";
    textEditor = "codium.desktop";
  };

  assoc = app: types: lib.genAttrs types (_: app);

  images = [
    "image/png"
    "image/jpeg"
    "image/gif"
    "image/webp"
    "image/svg+xml"
    "image/avif"
    "image/heif"
  ];

  videos = [
    "video/mp4"
    "video/webm"
    "video/quicktime"
    "video/x-matroska"
    "video/matroska" # mkv
    "video/x-msvideo"
    "video/vnd.avi" # avi
  ];

  audios = [
    "audio/mpeg" # mp3
    "audio/flac"
    "audio/ogg"
    "audio/aac"
    "audio/opus"
    "audio/mp4"
    "audio/x-m4a" # m4a
    "audio/x-wav"
    "audio/wav"
    "audio/vnd.wave"
  ];

  texts = [
    "text/plain"
    "text/markdown"
    "text/csv"
    "text/css"
    "text/javascript"
    "text/x-log"
    "text/x-python"
    "text/x-shellscript"
    "text/x-nix"
    "application/json"
    "application/xml"
    "application/x-yaml"
    "application/toml"
    "application/x-shellscript"
  ];

  browserTypes = [
    "text/html"
    "application/xhtml+xml"
    "x-scheme-handler/http"
    "x-scheme-handler/https"
    "x-scheme-handler/about"
    "x-scheme-handler/unknown"
  ];
in
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    }
    // lib.mapAttrs (_: dir: "${config.home.homeDirectory}/${dir}") {
      desktop = "Desktop";
      documents = "Documents";
      download = "Downloads";
      music = "Music";
      pictures = "Pictures";
      publicShare = "Public";
      templates = "Templates";
      videos = "Videos";
    };

    mimeApps = {
      enable = true;
      defaultApplications =
        assoc apps.imageViewer images
        // assoc apps.mediaPlayer (videos ++ audios)
        // assoc apps.pdfViewer [ "application/pdf" ]
        // assoc apps.textEditor texts
        // assoc apps.browser browserTypes;
    };
  };
}
