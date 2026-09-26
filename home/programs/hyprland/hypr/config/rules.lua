hl.window_rule({match = { class = "protonvpn-app" }, float = true, size = {440, 200}})
hl.window_rule({match = { class = "org.gnome.Loupe" }, float = true, size = {"(monitor_w*0.45)", "(monitor_h*0.45)"}})
hl.window_rule({match = { class = "input-remapper-gtk" }, float = true, size = {"(monitor_w*0.45)", "(monitor_h*0.45)"}})

for _, class in ipairs({ "org.fcitx.", "org.fcitx.Fcitx5.Addon.Lotus.Settings" , "org.kde.kdeconnect.app" }) do
  hl.window_rule({ match = { class = class }, float = true, size = { 750, 500 } })
end