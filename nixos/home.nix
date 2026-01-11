{ config, pkgs, ... }:

{
  home.username = "meltalizard";
  home.homeDirectory = "/home/meltalizard";
  home.stateVersion = "25.11";
  
  home.file = {
  ".config/hypr".source = ./hypr;
  ".config/kitty".source = ./kitty;
  };

  programs.home-manager.enable = true;

  programs.bash = {
  enable = true;
  };

  programs.starship = {
  enable = true;
  enableBashIntegration = true;
  settings = builtins.fromTOML (builtins.readFile ./starship.toml);
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
  ];
}
