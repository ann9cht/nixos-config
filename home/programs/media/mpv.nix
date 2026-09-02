{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      uosc
      thumbfast
    ];

    scriptOpts = {
      uosc = {
        window_controls = "no";
        top_bar = "no";
      };
    };

    config = {
      profile = "high-quality";
      save-position-on-quit = true; # Lưu vị trí xem dở
      
      # Tối ưu bộ nhớ đệm
      cache = "yes";
      demuxer-max-bytes = "400M"; 
      demuxer-max-back-bytes = "100M";
    };
  };
}