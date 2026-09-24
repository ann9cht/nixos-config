{
  imports = [
    ./tailscale.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNS = [
          "1.1.1.1#cloudflare-dns.com"
          "1.0.0.1#cloudflare-dns.com"
        ];
        Domains = [ "~." ];
        DNSOverTLS = "opportunistic";
      };
    };
  };

  # KDE connect
  programs.kdeconnect.enable = true;
}
