{ inputs, ... }:

{
  imports = [
    inputs.serpantinum.homeManagerModules.default
  ];

  programs.serpantinum = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaperDir = "/home/ann9cht/Wallpapers";

      general = {
        location = {
          latitude = 18.6733;
          longitude = 105.6813;
          city = "Vinh";
          region = "Nghe An";
          country_name = "Viet Nam";
          country_code = "VN";
          timezone = "Asia/Bangkok";
          source = "manual";
        };
        language = "vi";
        avatarPath = "/home/ann9cht/Pictures/avatar.jpg";
        muteSfx = false;
        sfxVolume = 100;
        quickactions = true;
        weatherInterval = 15;
        weatherUnit = "metric";
      };

      bar = {
        position = "left";
        width = 100;
        opacity = 100;
        style = "modular";
        time = {
          format = "HH:mm:ss";
        };
        autohide = false;
        autohideTimeout = 1000;
        workspaceCount = 5;
        groupColors = {
          g_kb = "#a0cafd";
        };
        modules = {
          left = [ "workspaces" "media" ];
          center = [ "timedate" "info" "weather" ];
          right = [
            [ "sysmon" "tray" "wifi" "vol" ]
          ];
        };
      };

      notifications = {
        dnd = false;
        position = "top right";
        sound = true;
        soundFile = "${inputs.serpantinum}/src/assets/sounds/notifications/Botanica.wav";
        showEmptyGraphic = true;
      };

      theme = {
        fontFamily = "Noto Sans";
        borderRadius = 29;
        activePreset = "Matugen";
        matugen = true;
      };

      launcher = {
        position = "right";
        width = 450;
        itemCount = 6;
        terminalCommand = "kitty -e";
        smartRanking = true;
      };
    };
  };
}
