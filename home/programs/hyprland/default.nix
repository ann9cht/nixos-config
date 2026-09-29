{
  imports = [
    ./serpantinum
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    systemd.enable = false;

    settings = {
      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1.0;
        }
      ];

      config = import ./settings/config.nix;

      curve = [
        {
          _args = [
            "myBezier"
            {
              type = "bezier";
              points = [
                [
                  0.05
                  0.9
                ]
                [
                  0.1
                  1.05
                ]
              ];
            }
          ];
        }
      ];

      animation = import ./settings/animation.nix;
      window_rule = import ./settings/window_rule.nix;
    };
  };
}
