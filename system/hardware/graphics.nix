{ inputs, pkgs, ... }:

let
  hyprNixpkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    package = hyprNixpkgs.mesa;
    package32 = hyprNixpkgs.pkgsi686Linux.mesa;
  };
}
