{ inputs, ... }:
{
  imports = [ inputs.luciole.nixosModules.default ];

  programs.luciole.enable = true;

  services = {
    udisks2.enable = true; # mount USB
    gvfs.enable = true; # thùng rác, ...
  };
}
