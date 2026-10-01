{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    languagePacks = [ "vi" ];

    policies = import ./extensions.nix;

    profiles.default = {
      settings = {
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";

        "intl.locale.requested" = "vi";
        "layout.spellcheckDefault" = 0;
        "dom.events.testing.asyncClipboard" = true; # Tắt cái bảng "Dán (P)"
      };

      presets.betterfox.enable = true;

      search = import ./search.nix;

      spacesForce = true;
      spaces = {
        "Bảo An" = {
          id = "822a73b3-d5b3-47d5-8c0c-89e7e1f682fe";
          position = 1000;
          theme = {
            type = "gradient";
            colors = [
              {
                red = 107;
                green = 125;
                blue = 174;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 55;
              }
              {
                red = 144;
                green = 107;
                blue = 174;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 55;
              }
              {
                red = 107;
                green = 174;
                blue = 168;
                algorithm = "analogous";
                type = "explicit-lightness";
                lightness = 55;
              }
            ];
            opacity = 0.5;
            texture = 0.0;
          };

          pins = import ./pins.nix;
        };
      };
    };
  };
}
