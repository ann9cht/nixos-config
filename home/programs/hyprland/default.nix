{ lib, pkgs, ... }:

{
  imports = [
    ./serpantinum.nix
  ];

  wayland.windowManager.hyprland.systemd.enable = false;

  xdg.configFile."hypr".source = ./hypr;
  home.activation.reloadHyprland = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    hyprsig=$(${pkgs.coreutils}/bin/ls "$XDG_RUNTIME_DIR/hypr" 2>/dev/null | head -n1)
    if [ -n "$hyprsig" ]; then
      HYPRLAND_INSTANCE_SIGNATURE="$hyprsig" $DRY_RUN_CMD ${pkgs.hyprland}/bin/hyprctl reload
    fi
  '';
}
