{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    bind =
      [
        "$mod,RETURN, exec, uwsm app -- ${pkgs.kitty}/bin/kitty" # kitty
        "$shiftMod,RETURN, exec, uwsm app -- ${pkgs.kitty}/bin/kitty -e tmux" # tmux
        "$mod, E, exec, uwsm app -- ${pkgs.kitty}/bin/kitty -e yazi"
        "$mod, V, exec, clipboard" # Clipboard picker with wofi
        "$shiftMod, L, exec,  uwsm app -- ${pkgs.hyprlock}/bin/hyprlock" # Lock
        "$mod, X, exec, powermenu" # Powermenu
        "$mod, D, exec, menu" # Launcher
        "$mod, period, exec, hyprfocus-toggle" # Toggle HyprFocus

        "$mod, Q, killactive," # Close window
        "$mod, SPACE, togglefloating," # Toggle Floating
        "$ALT, RETURN, fullscreen" # Toggle Fullscreen
        "$mod, left, movefocus, l" # Move focus left
        "$mod, right, movefocus, r" # Move focus Right
        "$mod, up, movefocus, u" # Move focus Up
        "$mod, down, movefocus, d" # Move focus Down

        "$mod, PRINT, exec, screenshot region" # Screenshot region
        "$shiftMod, PRINT, exec, screenshot window" # Screenshot window

        "$shiftMod, B, exec, hyprpanel-toggle" # Toggle hyprpanel
        "$mod, F2, exec, night-shift" # Toggle night shift

        "$mod, B, exec, hyprscratch toggle btop"
        "$shiftMod, C, exec, hyprscratch toggle lc"
        "$mod, N, exec, hyprscratch toggle nixy"
        "$mod, M, exec, hyprscratch toggle note"
        "$mod, slash, exec, hyprscratch toggle qterm"

        "$mod ALT, S, movetoworkspacesilent, special"
        "$mod ALT, S, movetoworkspace, previous"
        "$mod, S, togglespecialworkspace"

        "$mod, H, workspace, e-1"
        "$mod, L, workspace, e+1"
      ]
      ++ (builtins.concatLists (builtins.genList (i: let
          ws = i + 1;
        in [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ])
        9));

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,R, resizewindow" # Resize Window (mouse)
    ];

    bindl = [
      ",XF86AudioMute, exec, sound-toggle" # Toggle Mute
      ",XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # Play/Pause Song
      ",XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next" # Next Song
      ",XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous" # Previous Song
      ",switch:Lid Switch, exec, ${pkgs.hyprlock}/bin/hyprlock" # Lock when closing Lid
    ];

    bindle = [
      ",XF86AudioRaiseVolume, exec, sound-up" # Sound Up
      ",XF86AudioLowerVolume, exec, sound-down" # Sound Down
      ",XF86MonBrightnessUp, exec, brightness-up" # Brightness Up
      ",XF86MonBrightnessDown, exec, brightness-down" # Brightness Down
    ];
  };
}
