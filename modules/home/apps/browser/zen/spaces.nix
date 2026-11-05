{ lib, ... }:

let
  spaceName = "Bảo An";

  color = red: green: blue: {
    inherit red green blue;
    algorithm = "analogous";
    type = "explicit-lightness";
    lightness = 55;
  };

  mkPins =
    base: pins:
    lib.listToAttrs (
      lib.imap1 (
        i: pin:
        let
          position = base + i;
        in
        {
          inherit (pin) name;
          value =
            removeAttrs pin [
              "name"
              "pins"
            ]
            // {
              inherit position;
            }
            // lib.optionalAttrs (pin ? pins) {
              pins = mkPins (position * 10) pin.pins;
            };
        }
      ) pins
    );
in
{
  programs.zen-browser.profiles.default = {
    spacesForce = true;
    spaces.${spaceName} = {
      id = "822a73b3-d5b3-47d5-8c0c-89e7e1f682fe";
      position = 1000;

      theme = {
        type = "gradient";
        colors = [
          (color 107 125 174)
          (color 144 107 174)
          (color 107 174 168)
        ];
        opacity = 0.5;
        texture = 0.0;
      };

      pins = mkPins 100 [
        # cat /proc/sys/kernel/random/uuid
        {
          name = "Facebook";
          id = "1de20d17-6573-46dc-8b3e-f94edaebdbdf";
          url = "https://www.facebook.com";
          isEssential = true;
        }
        {
          name = "YouTube";
          id = "9c30dff0-3ba3-495f-9e24-a08ad8b2e1af";
          url = "https://www.youtube.com";
          isEssential = true;
        }
        {
          name = "GitHub";
          id = "fbcb5271-5672-420b-b071-116a1d8da414";
          url = "https://github.com";
          isEssential = true;
        }
        {
          name = "ChatGPT";
          id = "f1ec90ae-f1b2-49e7-b8d9-2b3caa968a83";
          url = "https://chatgpt.com";
          isEssential = true;
        }
        {
          name = "Crowdin";
          id = "9e7f20b0-cf9a-4601-bbd9-0ec95bee79e7";
          url = "https://crowdin.com/profile";
          isEssential = true;
        }
        {
          name = "Zalo";
          id = "ffaa1699-b422-43ed-9784-dfe8b171de1c";
          url = "https://chat.zalo.me";
          isEssential = true;
        }
        {
          name = "Claude";
          id = "ec62df23-64db-4d4a-ab6f-027b70e33d28";
          url = "https://claude.ai";
          isEssential = true;
        }
        {
          name = "Proton Mail";
          id = "776b929a-8d52-44a7-8b30-ed5c54d2e0b2";
          url = "https://mail.proton.me";
          isEssential = true;
        }
        {
          name = "Telegram";
          id = "31158007-228d-42bb-81f5-1e7b2ebe8d3b";
          url = "https://web.telegram.org/a/";
          isEssential = true;
        }
        {
          name = "Google";
          id = "359ce17d-8148-4301-806a-d1633bf7fe65";
          isFolderCollapsed = true;
          pins = [
            {
              name = "Gemini";
              id = "cb05eb72-68ca-4f72-85d3-cc1210bd1c59";
              url = "https://gemini.google.com/u/1/app?hl=vi";
            }
            {
              name = "Gmail";
              id = "53bec1dd-d8cc-41cb-95b2-c533ae416c6c";
              url = "https://mail.google.com/mail/u/0/#inbox";
            }
            {
              name = "Drive";
              id = "1a900810-8bf1-49ca-ab99-fa264cb57487";
              url = "https://drive.google.com/drive/my-drive?hl=vi";
            }
            {
              name = "Translate";
              id = "4d2a7c1e-8b36-4f5a-9e0d-6c3b1a7f2e94";
              url = "https://translate.google.com.vn/?sl=auto&tl=vi&op=translate";
            }
            {
              name = "Docs";
              id = "8a6e669c-7de8-407b-a977-b321cd6f5ac0";
              url = "https://docs.google.com/document/u/1/?hl=vi&pli=1";
            }
            {
              name = "Photos";
              id = "ef69ab96-b8f2-45b9-a838-174fd8270a5b";
              url = "https://photos.google.com/?pli=1";
            }
            {
              name = "Calendar";
              id = "65470e5f-32c5-4c08-9031-b25f8f052e78";
              url = "https://calendar.google.com/calendar/u/0/r?pli=1";
            }
            {
              name = "Keep";
              id = "e79a5a39-79e8-4d2f-afa2-4b6c6577c91b";
              url = "https://keep.google.com/u/0/";
            }
          ];
        }
      ];
    };
  };
}
