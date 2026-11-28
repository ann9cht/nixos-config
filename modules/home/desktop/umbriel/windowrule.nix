[
  { blur = true; } # blur toàn bộ cửa sổ

  {
    match.app_id = "^dev.noctalia.Noctalia$";
    default_floating = true;
    default_floating_size_px = {
      width = 1020;
      height = 700;
    };
  }
  {
    match.app_id = "^dev.noctalia.UmbrielSharePicker$";
    default_floating = true;
    default_floating_size_px = {
      width = 800;
      height = 600;
    };
  }
  {
    match.app_id = "^dev.noctalia.luciole$";
    default_floating = true;
    default_floating_size_px = {
      width = 864;
      height = 576;
    };
  }
  {
    match.app_id = "^kitty$";
    default_floating = true;
    default_floating_size_px = {
      width = 640;
      height = 400;
    };
  }
  {
    match.app_id = "^org.kde.kdeconnect.app$";
    default_floating = true;
    default_floating_size_px = {
      width = 810;
      height = 540;
    };
  }
  {
    match.app_id = "^org.fcitx.$";
    default_floating = true;
    default_floating_size_px = {
      width = 810;
      height = 540;
    };
  }
  {
    match.app_id = "^org.fcitx.Fcitx5.Addon.Lotus.Settings$";
    default_floating = true;
    default_floating_size_px = {
      width = 810;
      height = 540;
    };
  }
  {
    match.app_id = "^zen-beta$";
    default_scrolling_extent = 0.8;
  }
  {
    match.app_id = "^codium$";
    default_scrolling_extent = 0.8;
  }
  {
    match.app_id = "^ONLYOFFICE$";
    default_scrolling_extent = 0.8;
  }
  {
    match.title = "^(Picture-in-Picture|Picture in picture)$";
    default_floating = true;
    default_maximize = false;
    default_position = {
      x = 20;
      y = 20;
      anchor = "bottom_right";
    };
  }
  {
    match.title = "^notificationtoasts_.+_desktop";
    default_position = {
      x = 0;
      y = 0;
      anchor = "bottom_right";
    };
    default_focused = false;
    default_pinned = true;
  }
]
