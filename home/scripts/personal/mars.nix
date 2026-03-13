{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "mars"
      # bash
      ''
        # !/usr/bin/env bash
        # Simple wrapper to run Mars MIPS from CLI

        JAR="$HOME/apps/Mars.jar"

        if [[ ! -f "$JAR" ]]; then
            echo "Error: Mars.jar not found at $JAR"
            exit 1
        fi

        # Pass all arguments to Mars
        java -jar "$JAR" "$@"

      '')
  ];
}
