{ pkgs, ... }:
{
  imports = [
    ./steam.nix
    ./waydroid.nix
  ];

  environment.systemPackages = [
    pkgs.antigravity-ide
  ];
}
