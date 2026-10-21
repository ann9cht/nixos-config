{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        shell = "fish";
        title = "foot";
        font = "JetBrainsMono Nerd Font:size=12";
        letter-spacing = 0;
        dpi-aware = "no";
        pad = "25x25";
        bold-text-in-bright = "no";
        gamma-correct-blending = "no";
        selection-target = "clipboard";
      };

      bell.visual = "yes";

      scrollback = {
        lines = 10000;
        multiplier = 3;
        indicator-format = "line";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1.5;
      };

      colors-dark = {
        alpha = 0.78;
        alpha-mode = "matching";
        blur = "yes";
      };

      key-bindings = {
        clipboard-copy = "Control+Shift+c Control+Insert";
        clipboard-paste = "Control+Shift+v Shift+Insert";
        primary-paste = "none";

        scrollback-up-page = "Page_Up";
        scrollback-down-page = "Page_Down";
        search-start = "Control+Shift+f";
      };

      search-bindings = {
        cancel = "Escape";
        find-prev = "Shift+F3";
        find-next = "F3 Control+G";
      };
    };
  };
}
