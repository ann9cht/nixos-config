{ pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        qt6Packages.fcitx5-unikey
        fcitx5-lotus
      ];
    };
  };

  systemd = {
    packages = with pkgs; [ fcitx5-lotus ];
    services."fcitx5-lotus-server@ann9cht" = {
      wantedBy = [ "multi-user.target" ];
      overrideStrategy = "asDropin";
    };
  };
}
