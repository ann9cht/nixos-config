{ pkgs, ... }:

{
  programs.fish.enable = true;

  users.users."ann9cht" = {
    isNormalUser = true;
    initialPassword = "1";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
      "i2c"
      "video"
    ];
  };
}
