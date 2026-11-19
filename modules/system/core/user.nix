{
  config,
  pkgs,
  vars,
  ...
}:
{
  programs.fish.enable = true;

  users = {
    mutableUsers = false;
    users = {
      root.hashedPassword = "!";
      ${vars.username} = {
        isNormalUser = true;
        hashedPasswordFile = config.age.secrets.password.path;
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
