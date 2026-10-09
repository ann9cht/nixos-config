{
  imports = [
    ./bluetooth.nix
    ./remapper.nix
    ./sddm.nix
    ./snapper.nix
    ./sunshine.nix
  ];

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
    envfs.enable = true; # giả lập /bin/bash ...
  };
}
