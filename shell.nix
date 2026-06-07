{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    profileExtra = ''
      source /etc/profile
    '';
    bashrcExtra = ''
      export CHROME_EXECUTABLE="$(which brave)"
    '';
  };
}
