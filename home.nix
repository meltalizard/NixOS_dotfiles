{ config, pkgs, ... }:
{

  home.username = "meltalizard";
  home.homeDirectory = "/home/meltalizard";
  home.stateVersion = "25.11";
  
  xdg.enable = true;

  home.sessionVariables = {
    CHROME_EXECUTABLE = "${pkgs.brave}/bin/brave";
    SUDO_EDITOR = "nvim -n";
  };

  home.sessionPath = [
    "$HOME/.pub-cache/bin"
  ];

  programs.home-manager.enable = true;
  
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export CHROME_EXECUTABLE="$(which brave)"
    '';
  };

  services.swaync.enable = true;
  
  programs.starship = {
  enable = true;
  enableBashIntegration = true;
  };

  home.pointerCursor = {
  name = "Skyrim";
  package = pkgs.runCommand "Skyrim-cursor" {} ''
    mkdir -p $out/share/icons
    cp -r ${./cursors/Skyrim} $out/share/icons/Skyrim
  '';
  size = 24;
  gtk.enable = true;
  x11.enable = true;
  };
    
  programs.kitty = {
    enable = true;
    font = {
      name = "DepartureMono Nerd Font Mono";
      size = 12.0;
    };
    settings = {
      background_opacity = "0.55";
      cursor_shape = "block";
      cursor_blink_interval = 0;
    };
    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
    '';
  };
  
  fonts.fontconfig.enable = true;
  # WHEN ABOUT TO INSTALL ON NEW DEVICE, PICK OUT WHAT YOU ONLY NEED 
}
