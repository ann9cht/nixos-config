{ vars, ... }:
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
      nbu = "nh os boot --update";
      nt = "nh os test";
      ntu = "nh os test --update";
      nc = "nh clean all --keep-one";

      cnc = "codium ${vars.flakePath}; exit";
    };
  };
}
