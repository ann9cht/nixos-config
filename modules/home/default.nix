{ vars, ... }:
{
  imports = [
    ./apps
    ./desktop
    ./terminal
  ];

  home = {
    inherit (vars) username stateVersion;
    homeDirectory = vars.home;
  };
}
