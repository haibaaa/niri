{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Mostly system related configuration
    ../../nixos/audio.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/tailscale.nix
    ../../nixos/niri.nix

    # You should let those lines as is
    ./hardware-configuration.nix
    ./variables.nix
  ];

  home-manager.users."${config.var.username}" = import ./home.nix;

  environment.sessionVariables = {
    NH_FLAKE = "/home/haiba/.config/nixos";
  };

  # Enable Docker service with rootless mode
  virtualisation.docker = {
    enable = true;
    rootless.enable = true; # Enable Docker rootless mode
  };

  # Install Wireshark package
  environment.systemPackages = with pkgs; [
    wireshark
  ];

  programs.wireshark.dumpcap.enable = true;

  # Add your user to the docker group
  users.users."${config.var.username}" = {
    isNormalUser = true;
    extraGroups = ["docker" "wireshark"];
  };

  # Don't touch this
  system.stateVersion = "24.05";
}
