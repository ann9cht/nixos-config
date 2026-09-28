{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    languagePacks = [ "vi" ];

    profiles.default = {
      settings = {
        "zen.welcome-screen.seen" = true;
        "zen.urlbar.behavior" = "float";

        "layout.spellcheckDefault" = 0;
        "dom.events.testing.asyncClipboard" = true; # Tắt cái bảng "Dán (P)"
      };

      presets.betterfox.enable = true;
    };

    policies =
      let
        mkExtensionSettings = builtins.mapAttrs (
          _: pluginId: {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
            installation_mode = "force_installed";
          }
        );
      in
      {
        ExtensionSettings = mkExtensionSettings {
          "uBlock0@raymondhill.net" = "ublock-origin";
          "sponsorBlocker@ajay.app" = "sponsorblock";
          "jid1-wC71d7poAZYEGA@jetpack" = "ddict";
          "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = "video-downloadhelper";
          "{de22fd49-c9ab-4359-b722-b3febdc3a0b0}" = "popup-blocker";
        };
      };
  };
}
