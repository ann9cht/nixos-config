{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    git-hooks.url = "github:cachix/git-hooks.nix";
    serpantinum.url = "github:ilyamiro/serpantinum";
    xremap-flake.url = "github:xremap/nix-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.nixdesk = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host/default.nix
          ./system/default.nix

          inputs.serpantinum.nixosModules.default
          inputs.home-manager.nixosModules.home-manager
          inputs.xremap-flake.nixosModules.default

          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.ann9cht = import ./home/default.nix;
            };
          }
        ];
      };

      checks.x86_64-linux.pre-commit-check = inputs.git-hooks.lib.x86_64-linux.run {
        src = ./.;
        hooks = {
          statix.enable = true;
          deadnix.enable = true;
          nixfmt.enable = true;
        };
        excludes = [ "host/hardware-configuration.nix" ];
      };

      devShells.x86_64-linux.default =
        let
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        pkgs.mkShell {
          inherit (self.checks.x86_64-linux.pre-commit-check) shellHook;
          buildInputs = self.checks.x86_64-linux.pre-commit-check.enabledPackages;
        };
    };
}
