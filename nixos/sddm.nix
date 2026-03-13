# SDDM is a display manager for X11 and Wayland
{
  pkgs,
  inputs,
  ...
}: let
  custom-sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";
  };
in {
  services.displayManager = {
    sddm = {
      # package = pkgs.kdePackages.sddm;
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
      settings = {
        Wayland.SessionDir = "${
          inputs.hyprland.packages."${pkgs.stdenv.hostPlatform.system}".hyprland
        }/share/wayland-sessions";
      };
    };
  };

  environment.systemPackages = [
    custom-sddm-astronaut
    pkgs.sddm-astronaut
    pkgs.kdePackages.qtmultimedia
  ];
}
