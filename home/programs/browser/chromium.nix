{
  programs.chromium = {
    enable = true;
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock origin lite
    ];
    extraOpts = {
      "SpellcheckEnabled" = false;
    };
  };
}
