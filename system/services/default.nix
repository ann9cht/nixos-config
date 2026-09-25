{
  imports = [
    ./remapper.nix
    ./snapper.nix
    ./sunshine.nix

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
