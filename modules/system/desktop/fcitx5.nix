{ inputs, pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [
        inputs.fcitx5-lotus.packages.${pkgs.stdenv.hostPlatform.system}.fcitx5-lotus
      ];
    };
  };
}
