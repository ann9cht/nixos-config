{ pkgs, vars, ... }:
{
  programs.fish.enable = true;

  users = {
    mutableUsers = false;
    users = {
      root.hashedPassword = "!";
      ${vars.username} = {
        isNormalUser = true;
        shell = pkgs.fish;
        extraGroups = [
          "networkmanager"
          "wheel"
          "uinput"
        ];
      };
    };
  };
}
