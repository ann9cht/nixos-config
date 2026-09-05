{ lib, ... }:

{
  security = {
    polkit.enable = true;
    wrappers.pkexec = {
      enable = lib.mkForce true;
      owner = "root";
      group = "root";
      setuid = true;
      source = "${lib.getBin pkgs.polkit}/bin/pkexec";
    };
  };
}