let
  locale = "vi_VN";
in
{
  imports = [
    ./boot.nix
    ./security.nix
    ./user.nix
  ];

  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n = {
    defaultLocale = locale;
    extraLocaleSettings = {
      LC_ADDRESS = locale;
      LC_IDENTIFICATION = locale;
      LC_MEASUREMENT = locale;
      LC_MONETARY = locale;
      LC_NAME = locale;
      LC_NUMERIC = locale;
      LC_PAPER = locale;
      LC_TELEPHONE = locale;
      LC_TIME = locale;
    };
  };

  zramSwap.enable = true;

  # Không đc sửa
  system.stateVersion = "26.05";
}
