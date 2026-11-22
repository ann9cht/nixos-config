{
  inputs,
  pkgs,
  lib,
  vars,
  ...
}:
{
  specialisation.umbriel.configuration = {
    users.users.tumb = {
      isNormalUser = true;
      initialPassword = "test";
      extraGroups = [
        "wheel"
        "video"
        "input"
      ];
    };

    imports = with inputs; [
      umbriel.nixosModules.default
      luciole.nixosModules.default
    ];

    programs = {
      dux-shell.enable = lib.mkForce false;
      dux-search.enable = lib.mkForce false;

      umbriel.enable = true;
      noctalia = {
        enable = true;
        recommendedServices.enable = true;
      };
      luciole.enable = true;
    };

    services.gvfs.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users.tumb = {
      imports = [
        inputs.umbriel.homeModules.default
        ../../modules/home/terminal
        ../../modules/home/apps
      ];

      programs.umbriel = {
        enable = true;
        settings = {
          general.autostart = [ "noctalia" ];
          layout.gap = 5;
          input.keyboard.layout = "us";
          keybinds = {
            "Mod+T" = "spawn kitty";
            "Mod+C" = "spawn codium";
            "Mod+Z" = "spawn zen-beta";
            "Mod+Q" = "window-close";
            "Mod+Space" = "spawn noctalia msg panel-toggle launcher";
          };
        };
      };

      home = {
        inherit (vars) stateVersion;
      };

      home.packages = with pkgs; [
        cliphist
      ];
    };
  };
}
