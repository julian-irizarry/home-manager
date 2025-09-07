{ pkgs, ... }:

{
  programs.vscode = {
    enable = false;
    package = pkgs.vscodium; # or pkgs.vscode if you want the MS build
  };
}
