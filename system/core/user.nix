{ pkgs, ... }:

{
  programs.fish.enable = true;

  users.users = {
    "ann9cht" = {
      isNormalUser = true;
      initialPassword = "1";
      description = "ann9cht";
      extraGroups = [
        "networkmanager"
        "wheel"
        "uinput"
      ];
      shell = pkgs.fish;
    };
  };
}
