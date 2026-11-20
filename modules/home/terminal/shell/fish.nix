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
      nw = "nh os switch";
      nwu = "nh os switch --update";
      nb = "nh os boot";
      nbu = "nh os boot --update";
      nt = "nh os test";
      ntu = "nh os test --update";
      nbb = "nh os build";
      nc = "nh clean all --keep-one";

      cnc = "codium ${vars.flakePath}; exit";
      cnr = "codium ${vars.home}/.config/niri; exit";
    };
  };
}
