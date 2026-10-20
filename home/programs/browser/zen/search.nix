{
  force = true;
  default = "google";
  engines = {
    "bing".metaData.hidden = true;
    "coccoc".metaData.hidden = true;
    "ddg".metaData.hidden = true;
    "perplexity".metaData.hidden = true;
    "wikipedia-vi".metaData.hidden = true;

    youtube = {
      name = "YouTube";
      urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
      definedAliases = [ "@yt" ];
    };
    github = {
      name = "GitHub Search";
      urls = [ { template = "https://github.com/search?q={searchTerms}"; } ];
      definedAliases = [ "@gh" ];
    };
    nixpkgs = {
      name = "Nix Packages";
      urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
      definedAliases = [ "@pkg" ];
    };
    nixoptions = {
      name = "NixOS Options";
      urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
      definedAliases = [ "@op" ];
    };
    homemanager = {
      name = "Home Manager Options";
      urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}"; } ];
      definedAliases = [ "@hm" ];
    };
    nixwiki = {
      name = "NixOS Wiki";
      urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
      definedAliases = [ "@wk" ];
    };
  };
}
