#- ##Hdmi
#-
#- hook up to an hdmi display(mirror)
{pkgs, ...}: let
  hdmi =
    pkgs.writeShellScriptBin "hdmi"
    # bash
    ''
      hyprctl keyword monitor "HDMI-A-1, preferred, auto, 1, mirror,eDP-1"
      sleep 0.5
      hyprctl dispatch dpms on # Ensure display is on
    '';
in {home.packages = [hdmi];}
