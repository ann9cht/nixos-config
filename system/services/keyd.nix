{
  services.keyd = {
    enable = true;
    keyboards = {
      mouse = {
        ids = [ "30fa:1701" ];
        settings.main = {
          mouse1 = "C-insert"; # copy
          mouse2 = "S-insert"; # paste
        };
      };

      keyboard = {
        ids = [ "1c4f:0002" ];
        settings.main.f10 = "sysrq"; # Print Screen
      };
    };
  };
}
