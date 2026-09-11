{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        type = "auto";
        source = "${./lg.webp}";
        height = 9;
        width = 23;
        padding = {
          top = 1;
          left = 3;
        };
      };

      display = {
        separator = "  ";
        color = {
          separator = "#cdd6f4";
        };
      };

      modules = [
        "break"
        {
          type = "kernel";
          key = "  kernel";
          keyColor = "#89b4fa";
          format = "{release}";
        }
        {
          type = "command";
          key = "  uptime";
          text = "uptime -p | cut -d ' ' -f 2-";
          keyColor = "#74c7ec";
        }
        {
          type = "shell";
          key = "  shell ";
          keyColor = "#94e2d5";
          format = "{1}";
        }
        {
          type = "command";
          key = "  mem   ";
          text = "free -m | awk 'NR==2{printf \"%.2f GiB / %.2f GiB\",$3/1024,$2/1024}'";
          keyColor = "#a6e3a1";
        }
        {
          type = "packages";
          key = "  pkgs  ";
          keyColor = "#f9e2af";
          format = "{all}";
        }
        {
          type = "command";
          key = "  user  ";
          text = "echo $USER";
          keyColor = "#fab387";
        }
        {
          type = "command";
          key = "  hname ";
          text = "hostnamectl hostname";
          keyColor = "#f38ba8";
        }
        {
          type = "os";
          key = "󰻀  distro";
          keyColor = "#cba6f7";
          format = "{pretty-name}";
        }
        "break"
        {
          type = "colors";
          symbol = "circle";
        }
      ];
    };
  };
}
