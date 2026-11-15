{ inputs, ... }:
{
  imports = [ inputs.caelestia-shell.homeManagerModules.default ];
  programs.caelestia = {
    enable = true;
    systemd.enable = false;
    cli.enable = true;
  };
}
