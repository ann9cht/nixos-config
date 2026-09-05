_:

{
  imports = [
    ./sddm.nix
  ];

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    pipewire.pulse.enable = true; # Âm thanh
    gvfs.enable = true; # Mount phân vùng, ổ, thùng rác
    udisks2.enable = true; # Mount USB
    input-remapper.enable = true; # Setup chuột 6 nút
  };
}
