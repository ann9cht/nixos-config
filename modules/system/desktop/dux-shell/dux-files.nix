{
  programs.dux-files = {
    enable = true;
    portal.enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target";
      restartIfChanged = true;
    };
  };
}
