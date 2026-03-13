# Hyprlock is a lockscreen for Hyprland
{
  config,
  lib,
  ...
}: let
  font = config.stylix.fonts.serif.name;
in {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        ignore_empty_input = true;
        hide_cursor = true;
      };

      background = lib.mkForce {
        path = "$HOME/.config/nixos/wall/lock.png";
        brightness = 0.7;
      };

      # INPUT FIELD
      input-field = lib.mkForce {
        size = "300, 60";
        outline_thickness = 3;
        dots_size = 0.3; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(135, 135, 135, 1)";
        inner_color = "rgba(0, 0, 0, 0)";
        placeholder_text = "<i> </i>";
        font_color = "rgba(135, 135, 135, 1)";
        fade_on_empty = false;
        font_family = font + " Bold";
        position = "450, -300";
        halign = "center";
        valign = "center";
      };
    };
  };
}
