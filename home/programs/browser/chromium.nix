{
  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--disable-features=SpellcheckService" ];

    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock origin lite
    ];
  };
}
