{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # nix-locate -w lib
      wayland
      libxkbcommon
      vulkan-loader
      libglvnd
      glib
      nss
      nspr
      at-spi2-core
      cups
      dbus
      libdrm
      gtk3
      pango
      cairo
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      alsa-lib
      libxrandr
      libgbm
      expat
      libxcb
      libxcursor
      libxi
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      gsettings-desktop-schemas
      gtk3
    ];
    sessionVariables.XDG_DATA_DIRS = [
      "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
      "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    ];
  };
}
