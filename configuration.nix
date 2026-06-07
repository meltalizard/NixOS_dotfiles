{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos";
  environment.sessionVariables.NH_FLAKE = "/etc/nixos";
  
  # Enable networking
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false; 
  networking.nameservers = ["1.1.1.1" "8.8.8.8"];
  systemd.services.NetworkManager-wait-online.enable = false;

  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 14d";
  };
  nix.optimise.automatic = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };
  # Hyprland
  programs.hyprland.enable = true;
  
  # Display Manager
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
      user = "greeter";
    };
  };
  # Bluetooth
  hardware.bluetooth.powerOnBoot = false;
  # system services
  services.dbus.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT1 = 50;
      STOP_CHARGE_THRESH_BAT1 = 90;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";
      DISK_APM_LEVEL_ON_BAT = 128;
      USB_AUTOSUSPEND = 0;
      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_ON_AC = "on";
      PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "low-power";
    };
  };
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  hardware.enableAllFirmware = true;
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
  security.polkit.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  
  services.udev.extraRules = ''
  SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", MODE="0660", GROUP="dialout"
'';

  programs.adb.enable = true;
    users.users.meltalizard = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "plugdev" "input" 
    "audio" "adbusers" "dialout" "video" ];
  };
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim
    git
    kitty
    udiskie
    udisks
    sof-firmware
  ];
  system.stateVersion = "25.11";
}
