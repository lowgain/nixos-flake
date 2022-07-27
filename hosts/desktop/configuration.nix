{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking = {
    hostName = "fridge";
    firewall = {
      allowedTCPPorts = [  ];
      allowedUDPPorts = [  ];
    };
  };

  # Bluetooth enable
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable Qemu/KVM
  virtualisation.libvirtd.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    virt-manager
  ];

  programs = {

    # Enable the ssh key agent on boot
    ssh.startAgent = true;

  };
}