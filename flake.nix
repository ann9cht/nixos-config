{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    git-hooks.url = "github:cachix/git-hooks.nix";
    serpantinum.url = "github:ilyamiro/serpantinum";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #disko = {
    #  url = "github:nix-community/disko";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

    fcitx5-lotus = {
      url = "github:LotusInputMethod/fcitx5-lotus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    {
      nixosConfigurations.nixdesk = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host
          ./system

          inputs.serpantinum.nixosModules.default
        ];
      };

      checks.x86_64-linux.pre-commit-check = inputs.git-hooks.lib.x86_64-linux.run {
        src = ./.;
        hooks = {
          statix.enable = true;
          deadnix.enable = true;
          nixfmt.enable = true;
        };
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
