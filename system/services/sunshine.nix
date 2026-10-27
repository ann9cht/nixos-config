{
  services = {
    sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
    };

    avahi = {
      enable = true;
      settings.publish = {
        "disable-publishing" = false;
        disable-user-service-publishing = false;
        publish-addresses = true;
      };
    };
  };
}
