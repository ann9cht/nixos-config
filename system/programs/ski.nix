{ inputs, ... }:

{
  imports = [ "${inputs.ski}/nix/module.nix" ];

  programs.ski = {
    enable = true;
    # defaultFileManager = false; # k đặt như file manager mặc định
    # filePicker = false; # k đặt làm portal mặc định
  };
}
