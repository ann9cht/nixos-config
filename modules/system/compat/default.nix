{
  imports = [
    ./nix-ld.nix
  ];

  services.envfs.enable = true; # giả lập /bin/bash ...
}
