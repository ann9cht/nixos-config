{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;

      user = {
        name = "ann9cht";
        email = "90591960+ann9cht@users.noreply.github.com";
      };
    };
  };
}
