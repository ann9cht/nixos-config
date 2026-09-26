let
  flakeDir = "~/Projects/nixos-config";
in
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''

      set fish_greeting
      fastfetch

      bind \es 'commandline -C 0; commandline -i "sudo "; commandline -f end-of-line'
    '';

    shellAliases = {
      # nix
      frb = "sudo nixos-rebuild switch --flake ${flakeDir}#nixdesk";
      cln = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && sudo nix-collect-garbage -d";
      opt = "sudo nix-store --optimise";
      upd = "cd ${flakeDir} && nix flake update";

      # mở nhanh nixos-config
      cnf = "codium ${flakeDir}; exit";

      # eza dài quá
      ls = "eza --icons=always --group-directories-first";
      ll = "eza -la --icons=always --group-directories-first";
      tree = "eza --tree --icons=always";

      # bat k quen
      cat = "bat --style=plain";

      # lui dir nhanh
      ".." = "cd ..";
      "..." = "cd ../..";
    };
  };
}
