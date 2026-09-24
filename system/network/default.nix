{
  imports = [
    ./tailscale.nix
  ];

  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    nameservers = [
      "1.1.1.1#cloudflare-dns.com"
      "1.0.0.1#cloudflare-dns.com"
    ];
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSOverTLS = "opportunistic";
      };
    };
  };

  # KDE connect
  programs.kdeconnect.enable = true;
}
