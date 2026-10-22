{
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        font = "JetBrains Mono Nerd Font:size=12";
        pad = "25x25 center";
        selection-target = "clipboard";
      };

      bell.visual = "yes";

      cursor = {
        style = "beam";
        beam-thickness = 1.5;
      };

      scrollback = {
        lines = 10000;
        multiplier = 3;
        indicator-position = "relative";
        indicator-format = "line";
      };
    };
  };
}
