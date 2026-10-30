{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      add_newline = false;
      format = " $cmd_duration $directory$git_branch\n   $character";

      cmd_duration = {
        min_time = 0;
        format = "[](bold fg:252)[󰪢 $duration](bold bg:252 fg:235)[](bold fg:252)";
      };

      directory = {
        home_symbol = " ";
        read_only = "  ";
        style = "bg:#313244 fg:#cdd6f4";
        truncation_length = 2;
        truncation_symbol = ".../";
        format = "[](bold fg:#313244)[󰉋 → $path]($style)[](bold fg:#313244)";

        substitutions = {
          "Desktop" = "  ";
          "Documents" = "  ";
          "Downloads" = "  ";
          "Music" = " 󰎈 ";
          "Pictures" = "  ";
          "Videos" = "  ";
          "GitHub" = " 󰊤 ";
        };
      };

      git_branch = {
        style = "bg: 252";
        symbol = "󰘬";
        truncation_length = 12;
        truncation_symbol = "";
        format = " 󰜥 [](bold fg:252)[$symbol $branch(:$remote_branch)](fg:235 bg:252)[ ](bold fg:252)";
      };

      character = {
        success_symbol = "[ ](bold fg:#cdd6f4)";
        error_symbol = "[ ](bold fg:#cdd6f4)";
      };
    };
  };
}
