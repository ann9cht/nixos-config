let
  mkEngine = name: alias: template: {
    inherit name;
    urls = [ { inherit template; } ];
    definedAliases = [ alias ];
  };
in
{
  programs.zen-browser.profiles.default.search = {
    force = true;
    default = "google";

    engines = {
      "bing".metaData.hidden = true;
      "coccoc".metaData.hidden = true;
      "ddg".metaData.hidden = true;
      "perplexity".metaData.hidden = true;
      "wikipedia-vi".metaData.hidden = true;

      youtube = mkEngine "YouTube" "@yt" "https://www.youtube.com/results?search_query={searchTerms}";
      github = mkEngine "GitHub Search" "@gh" "https://github.com/search?q={searchTerms}";
      nixpkgs = mkEngine "Nix Packages" "@pkg" "https://search.nixos.org/packages?query={searchTerms}";
      nixoptions = mkEngine "NixOS Options" "@op" "https://search.nixos.org/options?query={searchTerms}";
      homemanager =
        mkEngine "Home Manager Options" "@hm"
          "https://home-manager-options.extranix.com/?query={searchTerms}";
      nixwiki = mkEngine "NixOS Wiki" "@wk" "https://wiki.nixos.org/w/index.php?search={searchTerms}";
    };
  };
}
