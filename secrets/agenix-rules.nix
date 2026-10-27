let
  me = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIALj7nZI0msY2mWAJLV+8DCN04L6qy34a2sWRA9AKKg5 ann9cht@proton.me"; # bat ~/.ssh/id_ed25519.pub | wl-copy
  nixdesk = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH4GMovBwhqyM0VKLZA5O0kGRTvT4n28chw7ww/RiBsi root@nixdesk"; # sudo bat /etc/ssh/ssh_host_ed25519_key.pub
  all = [
    me
    nixdesk
  ];
in
{
  "password.age".publicKeys = all;
  "git-key.age".publicKeys = all;
}
