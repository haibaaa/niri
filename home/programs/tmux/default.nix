{pkgs, ...}: {
  # Create tmux.reset.conf file with keybindings
  home.file.".config/tmux/tmux.reset.conf".text = ''
    # Keybindings
    bind ^X lock-server
    bind ^C new-window -c "$HOME"
    bind ^D detach
    bind * list-clients

    bind H previous-window
    bind L next-window

    bind r command-prompt "rename-window %%"
    bind R source-file ~/.config/tmux/tmux.conf
    bind ^A last-window
    bind ^W list-windows
    bind w list-windows
    bind z resize-pane -Z
    bind ^L refresh-client
    bind l refresh-client
    bind | split-window
    bind s split-window -v -c "#{pane_current_path}"
    bind v split-window -h -c "#{pane_current_path}"
    bind '"' choose-window
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
    bind -r -T prefix , resize-pane -L 20
    bind -r -T prefix . resize-pane -R 20
    bind -r -T prefix - resize-pane -D 7
    bind -r -T prefix = resize-pane -U 7
    bind : command-prompt
    bind * setw synchronize-panes
    bind P set pane-border-status
    bind c kill-pane
    bind x swap-pane -D
    bind S choose-session
    bind K send-keys "clear"\; send-keys "Enter"
    bind-key -T copy-mode-vi v send-keys -X begin-selection
  '';

  programs.tmux = {
    enable = true;

    # Basic plugins from nixpkgs
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
    ];

    extraConfig = ''
      source-file ~/.config/tmux/tmux.reset.conf
      set-option -g default-terminal 'screen-256color'
      set-option -g terminal-overrides ',xterm-256color:RGB'

      set -g prefix C-a
      set -g base-index 1
      set -g detach-on-destroy off
      set -g escape-time 0
      set -g history-limit 1000000
      set -g renumber-windows on
      set -g set-clipboard on
      set -g status-position top
      setw -g mode-keys vi
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'

      set -g @continuum-restore 'on'
      set -g @resurrect-strategy-nvim 'session'
    '';
  };
}
