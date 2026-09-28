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
    # about:debugging#/runtime/this-firefox
    "uBlock0@raymondhill.net" = "ublock-origin";
    "sponsorBlocker@ajay.app" = "sponsorblock";
    "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = "video-downloadhelper";
    "{5efceaa7-f3a2-4e59-a54b-85319448e305}" = "immersive-translate";
  };
}
