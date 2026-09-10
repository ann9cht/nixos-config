{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      font_size = "13.0";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      modify_font = "cell_height 110%";

      cursor_trail = 1;
      cursor_shape = "beam";
      cursor_beam_thickness = "1.5";

      background_opacity = "1.0";
      confirm_os_window_close = 0;

      scrollback_lines = 10000;
      wheel_scroll_min_lines = 1;

      enable_audio_bell = "no";
      hide_window_decorations = "yes";

      window_padding_width = 4;

      copy_on_select = "clipboard";

      open_url_with = "default";

      notify_on_cmd_finish = "unfocused 10.0";
      shell_integration = "enabled";
    };

    extraConfig = ''
      
            include ~/.config/kitty/colors.conf
            background #303446
            cursor #c6a0f6
    '';
  };
}
