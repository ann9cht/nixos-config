{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "material-you";
    extraPackages = with pkgs.kdePackages; [
      qt5compat
      qtsvg
      qtdeclarative
      qtwayland
    ];
  };
}