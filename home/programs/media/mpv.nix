{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;

    scripts = with pkgs.mpvScripts; [
      modernz
      thumbfast
      mpris
    ];

    config = {
      osc = "no";
      hwdec = "auto-safe";
      keep-open = "yes";
      save-position-on-quit = "yes";
    };
  };
}
