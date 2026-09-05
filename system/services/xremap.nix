_:

{
  services.xremap = {
    enable = true;
    withHypr = true;

    config = {
      modmap = [
        {
          name = "Inphic mouse side buttons";
          device = "INSTANT USB GAMING MOUSE";
          remap = {
            "BTN_SIDE" = "C-c";
            "BTN_EXTRA" = "C-v";
          };
        }
      ];
    };
  };
}
