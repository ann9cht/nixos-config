_:

{
  services.keyd = {
    enable = true;
    keyboards.mouse = {
      ids = [ "30fa:1701" ];
      settings = {
        main = {
          btn_extra = "C-v";
          btn_side = "C-c";
        };
      };
    };
  };
}
