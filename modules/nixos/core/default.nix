{
  imports = [
    ./boot.nix
    ./security.nix
    ./user.nix
  ];

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "vi_VN";

  zramSwap.enable = true;

  # Không đc sửa
  system.stateVersion = "26.05";
}
