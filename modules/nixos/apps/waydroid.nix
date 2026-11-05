{ pkgs, ... }:

{
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  environment.systemPackages = with pkgs; [ waydroid-helper ];

  systemd = {
    packages = with pkgs; [ waydroid-helper ];
    services.waydroid-mount.wantedBy = [ "multi-user.target" ];
  };
}
