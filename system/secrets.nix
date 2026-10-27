{ inputs, config, ... }:

{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets = {
      password.file = ../secrets/password.age;

      git-key = {
        file = ../secrets/git-key.age;
        owner = "ann9cht";
        mode = "0400";
      };
    };
  };

  users = {
    mutableUsers = false;
    users = {
      ann9cht.hashedPasswordFile = config.age.secrets.password.path;
      root.hashedPassword = "!";
    };
  };

  programs.ssh.extraConfig = ''
    Host github.com
      IdentityFile ${config.age.secrets.git-key.path}
      IdentitiesOnly yes
  '';
}
