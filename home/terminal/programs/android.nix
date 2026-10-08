{ pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools
    temurin-jre-bin-21
  ];

  xdg.desktopEntries.java = {
    name = "Java (Temurin 21)";
    icon = "java";
    exec = "env LD_LIBRARY_PATH=/run/current-system/sw/share/nix-ld/lib java -jar %f";
    type = "Application";
    terminal = false;
    noDisplay = true;
    mimeType = [ "application/x-java-archive" ];
  };
}
