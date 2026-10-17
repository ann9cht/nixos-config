{
  imports = [
    ./bluetooth.nix
    ./keyd.nix
    ./snapper.nix
    ./sunshine.nix

    ./sddm
  ];

  services = {
    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
    envfs.enable = true; # giả lập /bin/bash ...
  };
}
