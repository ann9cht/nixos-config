{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      fastfetch

      bind \es 'commandline -C 0; commandline -i "sudo "; commandline -f end-of-line'
    '';
  };
}
