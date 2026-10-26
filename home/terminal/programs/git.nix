{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;

      user = {
        name = "ann9cht";
        email = "ann9cht@proton.me";
      };
    };
  };
}
