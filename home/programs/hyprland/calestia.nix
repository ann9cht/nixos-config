{ inputs, ... }:

{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    systemd.enable = true;
    cli.enable = true;

    settings = {
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
  };
}
