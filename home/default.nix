{ config, ... }:

{
  imports = [ ./programs ];

  home = {
    username = "ann9cht";
    homeDirectory = "/home/ann9cht";
    stateVersion = "26.05";
  };

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