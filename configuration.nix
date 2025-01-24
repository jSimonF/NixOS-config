# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./courses/grudat.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Time zone
  time.timeZone = "Europe/Stockholm";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  users.users.simon = {
    isNormalUser = true;
    home = "/home/simon";
    description = "Simon Franklin";
    extraGroups = [ "wheel" "networkmanager" "input" "dialout" "docker" ];
  };


  services.getty.autologinUser = "simon";
  
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf = {
    enable = true;
  };
  
  security.pam.services.hyprlock = {};

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OXONE_WL = "1";
  };

  services.hardware.bolt.enable = true;

  hardware = {
    bluetooth.enable = true; # enables support for Bluetooth
    bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  };

  hardware.graphics = {
    enable = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  services.blueman.enable = true;

  security.rtkit.enable = true;  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Battery health
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;

      START_CHARGE_THRESH_BAT1=80;
      STOP_CHARGE_THRESH_BAT1 = 85;
    };
  };
  
  virtualisation.docker.enable = true;

  programs.thunar.enable = true;

  fonts.packages = with pkgs; [
    nerdfonts
    meslo-lgs-nf
  ];

  fonts.fontDir.enable = true;

  nixpkgs.config.allowUnfree = true;

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    unzip
    git
    fastfetch
    brightnessctl
    playerctl
    pavucontrol
    firefox
    spotify
    sqlitebrowser
    prusa-slicer

    #Hyprland
    waybar
    dunst
    kitty
    rofi-wayland
    libnotify
  ];

  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  system.stateVersion = "24.05"; # Did you read the comment?
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
