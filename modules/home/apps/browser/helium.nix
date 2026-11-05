{ inputs, ... }:

{
  imports = [ inputs.helium-flake.homeModules.default ];

  programs.helium = {
    enable = true;

    flags = [
      "--ozone-platform=wayland"
      "--no-default-browser-check"
      "--show-avatar-button=never"
    ];

    policies = {
      BrowserSignin = 0;
      SigninAllowed = false;
      SyncDisabled = true;
      SpellCheckServiceEnabled = false;
    };
  };
}
