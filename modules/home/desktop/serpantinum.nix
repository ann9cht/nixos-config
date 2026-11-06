{ inputs, vars, ... }:
{
  imports = [ inputs.serpantinum.homeManagerModules.default ];

  programs.serpantinum = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaperDir = "${vars.home}/Pictures/Wallpapers";

      general = {
        language = "vi";
        weatherUnit = "metric";
        weatherInterval = 30;
      };

      bar = {
        position = "top";
        style = "solid";
        width = 40;
        workspaceCount = 10;
        modules = {
          left = [ "workspaces" ];
          center = [ "time" ];
          right = [
            "tray"
            [
              "kb"
              "wifi"
              "bt"
              "vol"
              "bat"
            ]
          ];
        };
      };

      theme = {
        fontFamily = "Adwaita Mono";
        borderRadius = 12;
        matugen = true;
      };

      notifications = {
        dnd = false;
        position = "top right";
        sound = true;
      };
    };
  };
}
