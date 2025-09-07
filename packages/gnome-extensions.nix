{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.pop-shell
    gnomeExtensions.space-bar
    gnomeExtensions.workspace-switcher-manager
    gnomeExtensions.auto-move-windows
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "pop-shell@system76.com"
        "space-bar@luchrioh"
        "workspace-switcher-manager@G-dh.github.com"
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
      ];
    };
  };
}
