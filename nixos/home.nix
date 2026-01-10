{ config, pkgs, ... }:

{
  home.username = "meltalizard";
  home.homeDirectory = "/home/meltalizard";
  home.stateVersion = "25.11";
  
  home.file = {
  ".config/hypr".source = ./hypr;

  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [

  firefox
  brave

  discord
  obsidian

  yazi
  brightnessctl
  wl-clipboard
  zip
  neofetch
  starship

  waybar
  wofi
  pywal
  hyprpaper
  waytrogen

  xfce.thunar
  xfce.tumbler
  ffmpegthumbnailer

  bluez
  blueman

  font-awesome
  nerd-fonts.jetbrains-mono
  nerd-fonts.symbols-only
  monaspace
  ];
}
