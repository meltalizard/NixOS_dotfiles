{ config, pkgs, ... }:
{
  home.username = "meltalizard";
  home.homeDirectory = "/home/meltalizard";
  home.stateVersion = "25.11";
  
  home.file = {
  ".config/hypr".source = ./hypr;
  ".config/yazi".source = ./yazi;
  ".config/nvim".source = ./nvim;
  ".config/waybar".source = ./waybar;
  };
  
  home.sessionVariables = {
    CHROME_EXECUTABLE = "${pkgs.brave}/bin/brave";
  };
  
  programs.home-manager.enable = true;
  
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export CHROME_EXECUTABLE="$(which brave)"
    '';
  };
  
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./starship.toml);
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
  
  home.packages = with pkgs; [
    # For Development
    flutter
    python3
    clang
    vscode
    # Browsers
    firefox
    brave
    discord
    obsidian
    vlc
    btop
    zathura
    qbittorrent
    # Screenshot
    grim
    slurp
    # Ricing
    yazi
    brightnessctl
    zip
    neofetch
    waypaper
    waybar
    wofi
    pywal
    hyprpaper
    wlogout
    xfce.thunar
    xfce.tumbler
    xdg-utils
    ffmpegthumbnailer
    imv
    wl-clipboard
    # Bluetooth 
    bluez
    blueman
    # Fonts
    font-awesome
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
    monaspace
    nerd-fonts.departure-mono
  ];
}
