{ pkgs, ... }:

{
  imports = [
    ./keyd.nix
  ];

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    displayManager.sddm = {
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

    pipewire.pulse.enable = true; # Âm thanh
    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
    #input-remapper.enable = true; # Setup chuột 6 nút
  };
}