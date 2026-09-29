{
  general = {
    border_size = 0;
    gaps_in = 4;
    gaps_out = 6;
    float_gaps = 6;
    resize_on_border = true;
    extend_border_grab_area = 30;
  };

  decoration = {
    rounding = 12;
    active_opacity = 1.0;
    inactive_opacity = 1.0;
    blur = {
      enabled = true;
      size = 8;
      passes = 2;
      new_optimizations = true;
    };
    shadow = {
      enabled = false;
    };
  };

  input = {
    kb_layout = "us";
    kb_options = "grp:alt_shift_toggle";
    accel_profile = "flat";
    touchpad = {
      natural_scroll = true;
      disable_while_typing = false;
    };
    numlock_by_default = true;
  };

  # https://github.com/hyprwm/Hyprland/issues/9786
  render = {
    direct_scanout = false;
    cm_enabled = false;
    send_content_type = false;
    cm_auto_hdr = false;
    non_shader_cm = false;
  };

  misc = {
    vrr = false;
    focus_on_activate = false;
    font_family = "JetBrains Mono";
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
  };
}
