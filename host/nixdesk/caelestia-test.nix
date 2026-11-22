{
  inputs,
  pkgs,
  lib,
  vars,
  ...
}:
{
  specialisation.caelestia.configuration = {
    users.users.test = {
      isNormalUser = true;
      initialPassword = "test";
      extraGroups = [
        "wheel"
        "video"
        "input"
      ];
    };

    systemd.tmpfiles.rules = [ "d /home/test 0700 test users -" ];

    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    programs = {
      dux-shell.enable = lib.mkForce false;
      dux-search.enable = lib.mkForce false;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users.test = {
      imports = [
        inputs.caelestia-shell.homeManagerModules.default
        ../../modules/home/terminal
        ../../modules/home/apps
      ];

      home = {
        inherit (vars) stateVersion;
      };

      programs.caelestia = {
        enable = true;
        cli.enable = true;
      };

      wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;

        package = null;
        portalPackage = null;

        settings = {
          mod = {
            _var = "SUPER";
          };

          bind = [
            {
              _args = [
                (lib.generators.mkLuaInline "mod .. \" + Q\"")
                (lib.generators.mkLuaInline "hl.dsp.window.close()")
                { locked = true; }
              ];
            }
            {
              _args = [
                "SUPER + T"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"footclient\")")
              ];
            }
            {
              _args = [
                "SUPER + Z"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"zen-beta\")")
              ];
            }
            {
              _args = [
                "SUPER + E"
                (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"dfiles\")")
              ];
            }
            {
              _args = [
                "SUPER + SHIFT + Escape"
                (lib.generators.mkLuaInline "hl.dsp.exit()")
              ];
            }
          ];
        };
      };

      home.packages = with pkgs; [
        foot
        cliphist
        hyprpicker
        wireplumber
        jq
        eza
        starship
        btop
        fastfetch
      ];
    };
  };
}
