{ vars, ... }:
{
  imports = [
    ./apps
    ./desktop
    ./services
    ./terminal
  ];

  home = {
    inherit (vars) username stateVersion;
    homeDirectory = vars.home;
  };
}
