{ inputs, config, ... }:
{
  imports = [
    inputs.umbriel.homeModules.default
    ./autostart.nix
    ./keybinds.nix
    ./layerrule.nix
    ./windowrule.nix
  ];

  programs.umbriel = {
    enable = true;
    settings = {
      appearance.blur.radius = 3;

      input.keyboard = {
        layout = "us";
        numlock_toggle = true;
      };

      layout = {
        extent_presets = [
          0.4
          0.6
          0.8
        ];
        scrolling.default_extent_fraction = 0.5;
      };

      hot_corners.top_left = {
        enabled = true;
        delay_ms = 500;
        action = "overview-open";
      };

      include.optional.files = [ "${config.xdg.configHome}/umbriel/noctalia.toml" ];
    };
  };
}
