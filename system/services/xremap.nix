_:

{
  services.xremap = {
    enable = true;
    withHypr = true;

    config = {
      keymap = [
        {
          name = "Inphic mouse side buttons";
          device = {
            only = [ "INSTANT USB GAMING MOUSE" ];
          };
          remap = {
            "BTN_SIDE" = "C-c";
            "BTN_EXTRA" = "C-v";
          };
        }
      ];
    };
  };
}
