{
  imports = [
    ./snapper.nix
  ];

  services = {
    udisks2.enable = true; # mount USB
    gvfs.enable = true; # thùng rác, ...
  };
}
