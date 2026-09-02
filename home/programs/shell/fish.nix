{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fastfetch
    '';
    
    shellAliases = {
      bld = "sudo nixos-rebuild switch --flake ~/nixos/nixos-config#nixdesk";
      cln = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
      opt = "sudo nix-store --optimise";
      upd = "nix flake update";
    };
  };
}
