{
  config,
  vars,
  inputs,
  ...
}:
let
  cursor = config.home-manager.users.${vars.username}.home.pointerCursor;
in
{
  imports = [ inputs.sddm-themes.nixosModules.default ];

  programs.sddm-themes = {
    enable = true;
    theme = "material-you";
    cursor = { inherit (cursor) name size package; };
  };
}
