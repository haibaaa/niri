{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    inputs.hyprscratch.homeModules.default
  ];

  systemd.user.services.hyprscratch = {
    Unit = {
      After = ["graphical-session-pre.target" "hyprland.service"];
      PartOf = ["graphical-session.target"];
      Wants = ["hyprland.service"];
    };
    Service = {
      Type = "simple";
      ExecStart = lib.mkForce "${inputs.hyprscratch.packages.${pkgs.system}.default}/bin/hyprscratch init clean eager";
      Restart = "on-failure";
      RestartSec = "5s";
    };
    Install = {
      WantedBy = ["graphical-session-pre.target"];
    };
  };

  programs.hyprscratch = {
    enable = true;
    settings = {
      btop = {
        title = "scratchpad_btop";
        class = "kitty";
        command = "kitty -o font_size=12 --title scratchpad_btop -e btop";
        rules = "size 80% 80%";
        options = "cover sticky";
      };
      nixy = {
        title = "scratchpad_nixy";
        class = "kitty";
        command = "kitty -o font_size=13 --title scratchpad_nixy -e nixy";
        rules = "size 20% 40%; move 6% 53%";
        options = "cover sticky";
      };
      qterm = {
        title = "scratchpad_qterm";
        class = "kitty";
        command = "kitty --title scratchpad_qterm";
        rules = "size 97% 87%";
        options = "cover persist sticky";
      };
      lc = {
        title = "scratchpad_lc";
        class = "kitty";
        command = "kitty --title scratchpad_lc -e nvim -c 'Leet' -c 'sleep 1000m' -c 'Leet list'";
        rules = "size 87% 87%";
        options = "cover persist sticky";
      };
      note = {
        title = "scratchpad_note";
        class = "kitty";
        command = "kitty -o font_size=15 --title scratchpad_note -e nvim -c 'Neorg index'";
        rules = "size 95% 50%; move 3% 47%";
        options = "cover persist sticky";
      };
    };
  };
}
