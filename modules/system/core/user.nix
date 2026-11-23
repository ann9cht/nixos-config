{ pkgs, vars, ... }:
{
  programs.fish.enable = true;

  users.users = {
    ${vars.username} = {
      isNormalUser = true;
      initialPassword = "1";
      shell = pkgs.fish;
      extraGroups = [
        "networkmanager"
        "wheel"
        "i2c"
      ];
    };
  };
}
