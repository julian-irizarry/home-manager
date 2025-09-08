{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "zen" ''
      #!/usr/bin/env bash

      # Get current state: is fullscreen already on?
      state=$(kitty @ ls | ${pkgs.jq}/bin/jq '.[0].tabs[0].windows[0].fullscreen')

      if [ "$state" = "true" ]; then
        # turn OFF zen mode
        kitty @ set-window --self fullscreen no
        kitty @ set-tab-bar-style fading  # or your default
        kitty @ set-background-opacity 0.9
      else
        # turn ON zen mode
        kitty @ set-window --self fullscreen yes
        kitty @ set-tab-bar-style hidden
        kitty @ set-background-opacity 1.0
      fi
    '')
  ];
}
