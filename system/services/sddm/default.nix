{ pkgs, inputs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = "pixie";

    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs.kdePackages; [
      qtsvg
      qtdeclarative
      qt5compat
    ];
  };

  environment.systemPackages = [
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      background = ./bg.jpg;
      avatar = ./avt.jpg;
    })
  ];
}
