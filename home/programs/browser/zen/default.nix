{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
    ./extensions.nix
    ./search.nix
    ./spaces.nix
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    languagePacks = [ "vi" ];

    profiles.default = {
      presets.betterfox.enable = true;

      settings = {
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";

        "intl.locale.requested" = "vi";
        "layout.spellcheckDefault" = 0;
        "dom.events.testing.asyncClipboard" = true; # Tắt cái bảng "Dán (P)"
      };
    };
  };
}
