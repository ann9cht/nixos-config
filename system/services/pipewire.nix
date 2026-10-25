{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # Tắt đồng bộ âm lg tai nghe bluetooth
    wireplumber.extraConfig."51-bluez-sw-volume" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-hw-volume" = false;
      };
    };
  };
}
