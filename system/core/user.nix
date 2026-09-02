{ pkgs, ... }:

{
  programs.fish.enable = true;
  
  users.users."ann9cht" = {
    isNormalUser = true;
    description = "ann9cht";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };
}