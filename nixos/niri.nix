# Niri
{
  inputs,
  pkgs,
  ...
}: {
  programs.niri= {
    enable = true;
  };

  home.packages = with pkgs; [
    xwayland-satellite
    wl-clipboard
    grim
    slurp
    swaybg
  ];
}
