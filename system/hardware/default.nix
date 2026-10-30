{
  imports = [
    ./graphics.nix
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
