{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting

      if test "$TERM_PROGRAM" != vscode
        fastfetch
      end
    '';

    shellAbbrs = {
      ns = "nh os switch";
      nsu = "nh os switch --update";
      nb = "nh os boot";
      nt = "nh os test";
      nc = "nh clean all --keep-one";

      cnc = "codium ~/Projects/nixos-config; exit";
    };
  };
}
