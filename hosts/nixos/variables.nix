{
  config,
  lib,
  ...
}: {
  imports = [
    # Choose your theme here:
    # ../../themes/catppuccin.nix
  ];

  config.var = {
    hostname = "nixos";
    username = "haiba";
    configDirectory =
      "/home/"
      + config.var.username
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Kolkata";
    timeZone = "Asia/Kolkata";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";

    git = {
      username = "haibaaa";
      email = "9700samarth@gmail.com";
    };

    autoUpgrade = false;
    autoGarbageCollector = true;
  };

  # Let this here
  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = {};
    };
  };
}
