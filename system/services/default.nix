{
  imports = [
    ./keyd.nix
    ./pipewire.nix
    ./snapper.nix
    ./ssh.nix
    ./sunshine.nix

    ./sddm
  ];

  services = {
    udisks2.enable = true; # Mount USB
    envfs.enable = true; # giả lập /bin/bash ...
  };
}
