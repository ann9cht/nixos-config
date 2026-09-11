{ pkgs, lib, ... }:

{
  imports = [
    ./obsidian.nix
  ];

  home = {
    packages = with pkgs; [ onlyoffice-desktopeditors ];
    activation.copyOfficeFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p "$HOME/.local/share/fonts"
      cp -f ${pkgs.corefonts}/share/fonts/truetype/*.ttf "$HOME/.local/share/fonts/" 2>/dev/null || true
      cp -f ${pkgs.vista-fonts}/share/fonts/truetype/*.ttf "$HOME/.local/share/fonts/" 2>/dev/null || true
      chmod 644 "$HOME/.local/share/fonts/"*.ttf 2>/dev/null || true
    '';
  };
}
