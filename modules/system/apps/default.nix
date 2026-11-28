{ pkgs, ... }:
{
  imports = [
    ./onlyoffice.nix
    ./steam.nix
    ./waydroid.nix
  ];

  environment.systemPackages = [
    pkgs.antigravity-ide
  ];
}
