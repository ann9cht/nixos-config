{ inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [
        "noctalia"
        "fcitx5 -d"
        "kdeconnect-indicator"
      ];
      layout.gap = 5;
      input.keyboard.layout = "us";
      keybinds = {
        "Mod+T" = "spawn kitty";
        "Mod+E" = "spawn luciole";
        "Mod+C" = "spawn codium";
        "Mod+Z" = "spawn zen-beta";
        "Mod+Q" = "window-close";
        "Mod+Space" = "spawn noctalia msg panel-toggle launcher";
      };
    };
  };
}
