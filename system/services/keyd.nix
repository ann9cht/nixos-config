_:

{
  services.keyd = {
    enable = true;
    keyboards.mouse = {
      ids = [ "30fa:1701" ];
      settings = {
        main = {
          mouseforward = "C-v";
          mouseback = "C-c";
        };
      };
    };
  };
}
