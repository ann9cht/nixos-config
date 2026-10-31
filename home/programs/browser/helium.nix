{ inputs, pkgs, ... }:

{
  imports = [ inputs.helium-flake.homeModules.default ];

  programs.helium = {
    enable = true;

    # package = inputs.helium-flake.packages.${pkgs.stdenv.hostPlatform.system}.helium;

    flags = [
      "--ozone-platform=wayland"
      "--no-default-browser-check"
      "--show-avatar-button=never"
    ];

    policies = {
      BrowserSignin = 0;
      SyncDisabled = true;
      SpellcheckEnabled = false;
    };
  };
}