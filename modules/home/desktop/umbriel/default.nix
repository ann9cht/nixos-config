{ inputs, ... }:
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [
        "noctalia"
        "fcitx5 -d"
        "kdeconnect"
        "kdeconnect-indicator"
      ];

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

      keybinds = import ./keybinds.nix;

      window_rule = import ./windowrule.nix;

      layer_rule = [
        {
          match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
        }
        {
          match.namespace = "^noctalia-(notification|dock|panel|attached-panel|osd)$";
          blur_optimized = false;
        }
      ];
    };
  };
}
