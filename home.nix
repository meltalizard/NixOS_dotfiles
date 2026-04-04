{ config, pkgs, ... }:
{
  home.username = "meltalizard";
  home.homeDirectory = "/home/meltalizard";
  home.stateVersion = "25.11";
  
  xdg.enable = true;

  home.file = {
  ".config/yazi".source = ./yazi;
  };
  
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
  
  home.packages = with pkgs; [
    # For Development
    flutter
    firebase-tools
    python3
    pyright
    clang
    clang-tools
    vscode
    lua-language-server
    ripgrep
    rpi-imager
    docker

    # For B
    nodejs_24
    jdk21_headless
    android-tools
    watchman
    android-studio
    libnotify

    # Applications
    kicad
    arduino-ide
    gimp
    obs-studio

    # Keyring

    # LibreOffice
    libreoffice-qt
    hunspell

    # Browsers
    firefox
    brave
    google-chrome
    discord
    obsidian
    vlc
    btop
    zathura
    qbittorrent
    # Image/Screenshot
    grim
    slurp
    # Ricing
    waybar
    yazi
    brightnessctl
    zip
    fastfetch
    waypaper
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
    impala
    swaynotificationcenter
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
