{ inputs, config, vars, ... }:
{
  imports = [ inputs.agenix.nixosModules.default ];

  age = {
    identityPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    secrets = {
      password.file = ../../secrets/password.age;
      git-key = {
        file = ../../secrets/git-key.age;
        owner = vars.username;
        mode = "0400";
      };
    };
  };

  programs.ssh.extraConfig = ''
    Host github.com
      IdentityFile ${config.age.secrets.git-key.path}
      IdentitiesOnly yes
  '';
}
