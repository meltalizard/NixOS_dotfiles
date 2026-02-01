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

  networking.hostName = "nixos"; # Define your hostname.
  
  # Enable networking
  networking.networkmanager.enable = true;
  

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
	  command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
	  user = "greeter";
	};
	};
  # Bluetooth
  hardware.bluetooth.enable = true;

  # system services
  services.dbus.enable = true;

services.tlp = {
  enable = true;
  settings = {
   # Optional: helps save long-term battery health
    START_CHARGE_THRESH_BAT0 = 40; # Start charging at 40%
    STOP_CHARGE_THRESH_BAT0 = 95;  # Stop charging at 80%
  };
};

hardware.pulseaudio.enable = false;
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  
  services.gnome.gnome-keyring.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.sddm.enableGnomeKeyring = true; # if you use SDDM
  security.pam.services.greetd.enableGnomeKeyring = true; # if using greetd
  



  programs.adb.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.meltalizard = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "plugdev" "input" "audio" "adbusers" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  git
  kitty
  udiskie
  udisks
  sof-firmware
  ];

 system.stateVersion = "25.11"; # Did you read the comment?

}
