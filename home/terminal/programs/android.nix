{ pkgs, ... }:

{
  home.packages = with pkgs; [
    android-tools # adb, fastboot, ...
    temurin-jre-bin-21
  ];
}
