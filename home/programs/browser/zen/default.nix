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

        "layout.spellcheckDefault" = 0;
        "dom.events.testing.asyncClipboard" = true; # Tắt cái bảng "Dán (P)"
      };

      presets.betterfox.enable = true;

      search = import ./search.nix;
    };
  };
}
