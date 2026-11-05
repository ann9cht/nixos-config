{ lib, ... }:

let
  hidden =
    lib.genAttrs
      [
        "bing"
        "coccoc"
        "ddg"
        "perplexity"
        "wikipedia-vi"
      ]
      (_: {
        metaData.hidden = true;
      });

  engine = name: alias: template: {
    inherit name;
    urls = [ { inherit template; } ];
    definedAliases = [ alias ];
  };
in
{
  programs.zen-browser.profiles.default = {
    search = {
      force = true;
      default = "google";

      engines = hidden // {
        youtube = engine "YouTube" "@yt" "https://www.youtube.com/results?search_query={searchTerms}";
        github = engine "GitHub Search" "@gh" "https://github.com/search?q={searchTerms}";
        nixpkgs = engine "Nix Packages" "@pkg" "https://search.nixos.org/packages?query={searchTerms}";
        nixoptions = engine "NixOS Options" "@op" "https://search.nixos.org/options?query={searchTerms}";
        homemanager =
          engine "Home Manager Options" "@hm"
            "https://home-manager-options.extranix.com/?query={searchTerms}";
        nixwiki = engine "NixOS Wiki" "@wk" "https://wiki.nixos.org/w/index.php?search={searchTerms}";
      };
    };
  };
}
