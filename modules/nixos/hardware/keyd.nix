{
  services.keyd = {
    enable = true;
    keyboards = {
      mouse = {
        ids = [ "30fa:1701" ];
        settings.main = {
          mouse1 = "C-insert";
          mouse2 = "S-insert";
        };
      };

      keyboard = {
        ids = [ "1c4f:0002" ];
        settings.main.f10 = "print";
      };
    };
  };
}
