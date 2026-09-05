_:

{
  programs.firefox = {
    enable = true;

    languagePacks = [ "vi" ];

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
        # Tắt gạch chân đỏ chính tả
        "layout.spellcheckDefault" = 0;

        # Ẩn thanh Bookmark
        "browser.toolbars.bookmarks.visibility" = "never";

        # Setup 2 hàng lối tắt
        "browser.newtabpage.activity-stream.widgets.enabled" = false;
        "browser.newtabpage.activity-stream.widgets.sportsWidget.enabled" = false;
        "browser.newtabpage.activity-stream.topSitesRows" = 2;
        "browser.newtabpage.pinned" =
          ''[{"url":"https://www.facebook.com/","label":"Facebook","baseDomain":"facebook.com"},{"url":"https://www.youtube.com/","label":"Youtube","baseDomain":"youtube.com"},{"url":"https://crowdin.com/profile","label":"Crowdin"},{"url":"https://github.com/","label":"GitHub"},{"url":"https://chatgpt.com/","label":"ChatGPT"},{"url":"https://claude.ai/","label":"Claude"},{"url":"https://web.telegram.org/a/","label":"Telegram"},{"url":"https://chat.zalo.me/","label":"Zalo"},{"url":"https://gemini.google.com/","label":"Gemini"},{"url":"https://mail.google.com/mail/u/0/#inbox","label":"Gmail"},{"url":"https://drive.google.com/drive/u/1/home","label":"Drive"},{"url":"https://keep.google.com/u/1/","label":"Ghi chú"},{"url":"https://docs.google.com/document/u/0/","label":"Docs"},{"url":"https://photos.google.com/u/1/?pli=1&pageId=none","label":"Photo"},{"url":"https://calendar.google.com/calendar/u/1/r","label":"Lịch"},{"url":"https://translate.google.com.vn/?sl=auto&tl=vi&op=translate","label":"Google Dịch"}]'';
      };
    };

    policies = {
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = false;
          };
          "jid1-wC71d7poAZYEGA@jetpack" = {
            install_url = moz "ddict";
            installation_mode = "force_installed";
            updates_disabled = false;
          };
          "{b9db16a4-6edc-47ec-a1f4-b86292ed211d}" = {
            install_url = moz "video-downloadhelper";
            installation_mode = "force_installed";
            updates_disabled = false;
          };
        };
    };
  };
}
