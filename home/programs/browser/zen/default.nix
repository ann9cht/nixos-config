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
          icon = "🏠";
          theme = {
            type = "gradient";
            gradientColors = [
              {
                c = [
                  107
                  125
                  174
                ];
                isCustom = false;
                algorithm = "analogous";
                isPrimary = true;
                lightness = "55";
                position = {
                  x = 81;
                  y = 84;
                };
                type = "explicit-lightness";
              }
              {
                c = [
                  144
                  107
                  174
                ];
                isCustom = false;
                algorithm = "analogous";
                isPrimary = false;
                lightness = "55";
                position = {
                  x = 189;
                  y = 43;
                };
                type = "explicit-lightness";
              }
              {
                c = [
                  107
                  174
                  168
                ];
                isCustom = false;
                algorithm = "analogous";
                isPrimary = false;
                lightness = "55";
                position = {
                  x = 43;
                  y = 193;
                };
                type = "explicit-lightness";
              }
            ];
            opacity = 0.5;
            texture = 0;
          };
        };
      };
    };
  };
}
