{ inputs, ... }:

{
  imports = [ "${inputs.ski}/nix/module.nix" ];

  programs.ski = {
    enable = true;
    defaultFileManager = false; # giữ file manager hiện tại
    filePicker = false; # giữ hộp thoại Open/Save của GTK
  };
}
