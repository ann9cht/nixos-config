{
  imports = [
    ./keyd.nix
    ./pipewire.nix
    ./snapper.nix
    ./sunshine.nix

    ./sddm
  ];

  services = {
    power-profiles-daemon.enable = true;

    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
    envfs.enable = true; # giả lập /bin/bash ...
  };
}
