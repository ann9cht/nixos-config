{
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

    systemd.tmpfiles.rules = [ "d /home/tumb 0700 test users -" ];

    programs = {
      dux-shell.enable = lib.mkForce false;
      dux-search.enable = lib.mkForce false;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    home-manager.users.tumb = {
      imports = [
        ../../modules/home/terminal
        ../../modules/home/apps
      ];

      home = {
        inherit (vars) stateVersion;
      };

      home.packages = with pkgs; [
        cliphist
      ];
    };
  };
}
