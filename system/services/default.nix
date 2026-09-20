{
  imports = [
    ./remapper.nix
    ./snapper.nix

    ./sddm
  ];

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
  };
}
