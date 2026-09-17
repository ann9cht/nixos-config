{ pkgs, ... }:

{
  systemd.user.services.input-remapper-autoload = {
    Unit = {
      After = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = toString (
        pkgs.writeShellScript "ir-autoload-retry" ''
          for i in $(seq 1 15); do
            ${pkgs.input-remapper}/bin/input-remapper-control --command autoload && exit 0
            sleep 1
          done
          exit 1
        ''
      );
    };
  };
}
