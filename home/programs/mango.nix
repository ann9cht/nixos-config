{ inputs, ... }:

{
  imports = [ inputs.mango.hmModules.mango ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
  };
}
