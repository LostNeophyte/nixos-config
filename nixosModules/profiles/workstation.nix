{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.profiles.workstation;

  timeoutConfig = ''
    DefaultTimeoutStartSec=10s
    DefaultTimeoutStopSec=10s
    DefaultTimeoutAbortSec=10s
    DefaultDeviceTimeoutSec=10s
  '';
in {
  options.my.profiles.workstation.enable = lib.mkEnableOption "the workstation profile";

  config = lib.mkIf cfg.enable {
    my.users = {
      enable = true;
      home-manager.enable = true;
    };

    programs.firefox.enable = true;

    services.earlyoom = {
      enable = true;
      enableNotifications = true;
    };

    systemd.extraConfig = timeoutConfig;
    systemd.user.extraConfig = timeoutConfig;

    services.flatpak.enable = true;
    xdg.portal.enable = true;

    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.defaultSession = "plasmax11";
    environment.systemPackages = with pkgs; [kdePackages.plasma-pa];

    hardware.enableAllFirmware = true;
  };
}
