{ inputs, ... }:
{
  imports = [
    inputs.umbriel.homeModules.default
    ./autostart.nix
    ./keybinds.nix
  ];

  programs.umbriel = {
    enable = true;
    settings = {
      layout.gap = 5;
      input = {
        focus.follows_mouse = true;
        keyboard = {
          layout = "us";
          numlock_toggle = true;
        };
      };
    };
  };
}
