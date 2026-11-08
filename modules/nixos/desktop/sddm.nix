{
  config,
  vars,
  pkgs,
  ...
}:
let
  cursor = config.home-manager.users.${vars.username}.home.pointerCursor;

  themeName = "material-you";

  sddm-theme = pkgs.runCommandLocal "sddm-theme-${themeName}" { } ''
    mkdir -p $out/share/sddm/themes
    cp -r ${../../../assets/sddm/${themeName}} $out/share/sddm/themes/${themeName}
  '';
in
{
  environment.systemPackages = [
    sddm-theme
    cursor.package
  ];

  services = {
    xserver.enable = true;
    displayManager.sddm = {
      enable = true;
      theme = themeName;
      extraPackages = [ pkgs.kdePackages.qt5compat ];
      settings.Theme = {
        CursorTheme = cursor.name;
        CursorSize = cursor.size;
      };
      setupScript = ''
        ${pkgs.xrdb}/bin/xrdb -merge <<EOF
        Xcursor.theme: ${cursor.name}
        Xcursor.size: ${toString cursor.size}
        EOF
      '';
    };
  };
}
