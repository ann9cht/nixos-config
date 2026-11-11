{ inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [ "noctalia" ];
      layout.gap = 5;
      input.keyboard.layout = "us";
      keybinds = {
        "Mod+T" = "spawn kitty";
        "Mod+Q" = "window-close";
        "Mod+Space" = "spawn noctalia msg panel-toggle launcher";
        "Mod+Comma" = "spawn noctalia msg settings-toggle";
      };
    };
  };
}
