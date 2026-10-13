{ pkgs, ... }:

let
  flakePath = "/home/ann9cht/Projects/nixos-config";
  host = "nixdesk";
in
{
  programs.vscodium = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        sumneko.lua
        christian-kohler.path-intellisense
        mkhl.direnv
      ];

      userSettings = {
        "terminal.integrated.copyOnSelection" = true;

        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
        "terminal.integrated.lineHeight" = 1;
        "terminal.integrated.customGlyphs" = true;

        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorWidth" = 2;
        "terminal.integrated.cursorBlinking" = true;

        "diffEditor.ignoreTrimWhitespace" = false;

        "[nix]"."editor.formatOnSave" = true;

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.serverSettings".nixd = {
          formatting.command = [ "nixfmt" ];
          options = {
            nixos.expr = ''(builtins.getFlake "${flakePath}").nixosConfigurations.${host}.options'';
            home-manager.expr = ''(builtins.getFlake "${flakePath}").nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []'';
          };
        };
      };
    };
  };

  home.packages = with pkgs; [ nixd ];
}
