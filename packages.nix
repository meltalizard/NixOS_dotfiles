{pkgs, ...}:
let
  androidComposition = pkgs.androidenv.composeAndroidPackages {
    cmdLineToolsVersion = "13.0";
    platformToolsVersion = "35.0.2";
    buildToolsVersions = [ "34.0.0" ];
    platformVersions = [ "34" ];
    includeEmulator = false;
    includeSources = false;
    includeSystemImages = false;
  };
in
{
  home.packages = with pkgs; [

    # For Development
    (python3.withPackages (ps: with ps; [
      opencv4
    ]))
    mpremote
    flutter
    firebase-tools
    pyright
    clang
    clang-tools
    vscode
    lua-language-server
    ripgrep
    rpi-imager
    docker
    supabase-cli
    androidComposition.androidsdk
    usbutils
    pyright

    # For B
    nodejs_24
    jdk17
    android-tools
    watchman
    android-studio
    libnotify

    # Tools
    nmap
    wireshark
    speedtest-cli
    lm_sensors

    # Applications
    kicad
    arduino-ide
    gimp
    obs-studio
    qdirstat

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
    swaynotificationcenter
    hyprlock
    hypridle
    gvfs

    #LARPMAXXING
    mapscii
    cmatrix
    cbonsai

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


