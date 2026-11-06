{ inputs, vars, ... }:
{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = import ../home;
  };
}
