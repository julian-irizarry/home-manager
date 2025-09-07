{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "julian";
  home.homeDirectory = "/home/julian";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
      "google-chrome"
      "spotify"
    ];

  home.packages = with pkgs; [
    # nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  imports = [
    ./packages/packages.nix
    # ./packages/gnome-extensions.nix
    ./programs/programs.nix
    ./programs/neovim.nix
    ./programs/kitty.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/vscode.nix
  ];

  home.activation.make-zsh-default-shell = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    # if zsh is not the current shell
    PATH="/usr/bin:/bin:$PATH"
    ZSH_PATH="/home/julian/.nix-profile/bin/zsh"
    if [[ $(getent passwd julian) != *"$ZSH_PATH" ]]; then
      echo "setting zsh as default shell (using chsh). password might be necessay."
      if ! grep -q $ZSH_PATH /etc/shells; then
        echo "adding zsh to /etc/shells"
        sudo sh -c "echo '$ZSH_PATH' >> /etc/shells"
      fi
      echo "running chsh to make zsh the default shell"
      sudo chsh -s $ZSH_PATH julian
      echo "zsh is now set as default shell !"
    fi
  '';

  home.shell.enableZshIntegration = true;

  home.sessionVariables = {
    TERMINAL = "kitty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
