_:

{
  programs = {
    nano = {
      enable = true;
      syntaxHighlight = true;
      nanorc = ''
        set nowrap
        set tabstospaces
        set tabsize 2
      '';
    };
    nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
  };
}
