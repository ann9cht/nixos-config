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
    ];
  };
}
