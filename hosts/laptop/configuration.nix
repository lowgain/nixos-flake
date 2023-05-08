{ pkgs, lib, user, ... }:

{

  imports = 
    ( import ./hardware-configuration.nix );

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=3" ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  networking = {
    hostName = "frying-pan";
    wireless.iwd.enable = true;
  };

  # Mullvad VPN
  services.mullvad-vpn.enable = true;

  # Set lid switch action
  services.logind.lidSwitch = "ignore";

  # Enable trackpad
  services.xserver.libinput.enable = true;

  # Enable the ssh key agent on boot
  programs.ssh.startAgent = true;

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable Qemu/KVM
  virtualisation.libvirtd.enable = true;

  # Enable phone mounting
  services.gvfs.enable = true;

  # Enable docker containers
  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
      dates = "daily";
    };
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];
}
