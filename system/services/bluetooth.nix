{
  services.pipewire.wireplumber.extraConfig."51-bluez-sw-volume" = {
    "monitor.bluez.properties" = {
      "bluez5.enable-hw-volume" = false;
    };
  };
}
