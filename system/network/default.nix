{ pkgs, ... }:

{
  imports = [
    ./tailscale.nix
  ];

  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [ proton-vpn ];
}
