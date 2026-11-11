{ pkgs, ... }:
{
  home.packages = [ pkgs.gh ];

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

      alias = {
        ad = "add";

        b = "branch";
        ba = "branch -a";
        bd = "branch -d";
        bdd = "branch -D";

        cl = "clone";

        d = "diff";
        ds = "diff --staged";

        h = "show";
        h1 = "show HEAD^";
        h2 = "show HEAD^^";
        h3 = "show HEAD^^^";
        h4 = "show HEAD^^^^";
        h5 = "show HEAD^^^^^";

        p = "push";
        pl = "pull";
      };
    };
  };
}
