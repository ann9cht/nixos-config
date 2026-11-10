{
  programs.kitty = {
    enable = true;

    keybindings = {
      "ctrl+insert" = "copy_to_clipboard";
      "shift+insert" = "paste_from_clipboard";
    };

    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = "13.0";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      modify_font = "cell_height 110%";

      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";
      cursor_trail = 1;

      background_opacity = "0.65";
      hide_window_decorations = "yes";
      window_padding_width = 4;
      remember_window_size = "no";
      confirm_os_window_close = 0;

      scrollback_lines = 10000;
      wheel_scroll_min_lines = 3;

      enable_audio_bell = "no";
      copy_on_select = "clipboard";
      open_url_with = "default";
      notify_on_cmd_finish = "unfocused 10.0";
      shell_integration = "enabled";

      background = "#0d1726";
      foreground = "#e8e4dc";
      selection_background = "#3a4f73";
      selection_foreground = "#ffffff";
      url_color = "#8fb8de";

      color0 = "#1b2638";
      color1 = "#e76f6f";
      color2 = "#8fbf9f";
      color3 = "#f2c879";
      color4 = "#6fa3d8";
      color5 = "#c792b8";
      color6 = "#6cc4c9";
      color7 = "#d8d4cc";

      color8 = "#7d8fab";
      color9 = "#f28b82";
      color10 = "#a8d5b5";
      color11 = "#f7d9a0";
      color12 = "#8fbfee";
      color13 = "#e0a9d0";
      color14 = "#8fdadd";
      color15 = "#f5f1ea";
    };
  };
}
