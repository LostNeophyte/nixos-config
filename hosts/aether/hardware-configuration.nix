# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.supportedFilesystems = ["btrfs"];
  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt" "usbhid" "usb_storage" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b92faa50-b0e3-4002-8bb4-2e7fb9c2da29";
    fsType = "btrfs";
    options = ["subvol=root" "compress=zstd:1" "noatime"];
  };

  boot.initrd.luks.devices."luks".device = "/dev/disk/by-uuid/94c1cebc-1a92-4f19-87e7-f1a5b0524128";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/b92faa50-b0e3-4002-8bb4-2e7fb9c2da29";
    fsType = "btrfs";
    options = ["subvol=home" "compress=zstd:1" "noatime"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/b92faa50-b0e3-4002-8bb4-2e7fb9c2da29";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd:1" "noatime"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/36E8-AB68";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}