{
  pkgs,
  config,
  ...
}: {
  imports = [
    # Mostly user-specific configuration
    ./variables.nix

    # Programs
    ../../home/programs/tmux
    ../../home/programs/kitty
    ../../home/programs/nvf
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/git/signing.nix
    ../../home/programs/spicetify
    ../../home/programs/thunar
    ../../home/programs/lazygit
    ../../home/programs/zen
    ../../home/programs/discord
    ../../home/programs/tailscale

    # personal
    ../../home/programs/yazi

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    # ../../home/system/swaylock
    ../../home/system/wofi
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/noctalia
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    packages = with pkgs; [
      # staged for deletion
      # bitwarden # Password manager
      # nix-search-tv
      # firefox
      # ncspot

      linux-wifi-hotspot
      shotcut
      nix-ld
      caligula
      anki
      nh
      aria2
      woeusb
      opencode
      sqlite
      stow
      qpdf
      geoclue2
      zed-editor
      yazi

      qutebrowser
      material-design-icons
      presenterm # presentations
      glow # md reader

      github-cli # Github cli
      vlc # Video player
      blanket # White-noise app
      obsidian # Note taking app
      textpieces # Manipulate texts
      curtail # Compress images

      # Privacy
      session-desktop # Session app, private messages

      # Dev
      go
      rustup
      uv
      jdk25
      bun
      nodejs
      openssl
      python3
      jq
      just
      pnpm
      air
      duckdb

      # Utils
      zip
      unzip
      optipng
      jpegoptim
      pfetch
      btop
      fastfetch

      # Just cool
      obs-studio
      peaclock
      cbonsai
      pipes
      gnumake
      cmatrix

      # Backup
      vscode
    ];

    # Import my profile picture, used by the hyprpanel dashboard
    file.".face.icon" = {
      source = ./profile_picture.png;
    };

    # Don't touch this
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
