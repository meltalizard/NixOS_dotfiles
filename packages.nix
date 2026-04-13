{pkgs, ...}:
{
  home.packages = with pkgs; [

    # For Development
    (python3.withPackages (ps: with ps; [
      opencv4
    ]))
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

    # For B
    nodejs_24
    jdk21_headless
    android-tools
    watchman
    android-studio
    libnotify

    # Networking
    nmap
    wireshark

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


