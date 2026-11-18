{ lib, ... }:
let
  spaceName = "Bảo An";

  color = red: green: blue: {
    inherit red green blue;
    algorithm = "analogous";
    type = "explicit-lightness";
    lightness = 55;
  };

  mkUuid =
    seed:
    let
      h = builtins.hashString "sha256" "zen-pin:${seed}";
      s = builtins.substring;
      variant = builtins.elemAt [ "8" "9" "a" "b" ] (lib.mod (lib.fromHexString (s 16 1 h)) 4);
    in
    "${s 0 8 h}-${s 8 4 h}-4${s 13 3 h}-${variant}${s 17 3 h}-${s 20 12 h}";

  mkPins =
    base: prefix: pins:
    lib.listToAttrs (
      lib.imap1 (
        i: pin:
        let
          position = base + i;
          path = "${prefix}/${pin.name}";
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
              id = pin.id or (mkUuid path);
            }
            // lib.optionalAttrs (pin ? pins) {
              pins = mkPins (position * 10) path pin.pins;
            };
        }
      ) pins
    );
in
{
  programs.zen-browser.profiles.default = {
    spacesForce = true;
    pinsForce = true;
    pinsForceAction = "remove";
    spaces.${spaceName} = {
      id = mkUuid "space/${spaceName}";
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

      pins = mkPins 100 spaceName [
        {
          name = "Facebook";
          url = "https://www.facebook.com";
          isEssential = true;
        }
        {
          name = "YouTube";
          url = "https://www.youtube.com";
          isEssential = true;
        }
        {
          name = "GitHub";
          url = "https://github.com";
          isEssential = true;
        }
        {
          name = "ChatGPT";
          url = "https://chatgpt.com";
          isEssential = true;
        }
        {
          name = "Crowdin";
          url = "https://crowdin.com/profile";
          isEssential = true;
        }
        {
          name = "Zalo";
          url = "https://chat.zalo.me";
          isEssential = true;
        }
        {
          name = "Claude";
          url = "https://claude.ai";
          isEssential = true;
        }
        {
          name = "Proton Mail";
          url = "https://mail.proton.me";
          isEssential = true;
        }
        {
          name = "Telegram";
          url = "https://web.telegram.org/a/";
          isEssential = true;
        }
        {
          name = "Google";
          isFolderCollapsed = true;
          pins = [
            {
              name = "Gemini";
              url = "https://gemini.google.com/u/1/app?hl=vi";
            }
            {
              name = "Gmail";
              url = "https://mail.google.com/mail/u/0/#inbox";
            }
            {
              name = "Drive";
              url = "https://drive.google.com/drive/my-drive?hl=vi";
            }
            {
              name = "Translate";
              url = "https://translate.google.com.vn/?sl=auto&tl=vi&op=translate";
            }
            {
              name = "Docs";
              url = "https://docs.google.com/document/u/1/?hl=vi&pli=1";
            }
            {
              name = "Photos";
              url = "https://photos.google.com/?pli=1";
            }
            {
              name = "Calendar";
              url = "https://calendar.google.com/calendar/u/0/r?pli=1";
            }
            {
              name = "Keep";
              url = "https://keep.google.com/u/0/";
            }
          ];
        }
      ];
    };
  };
}
