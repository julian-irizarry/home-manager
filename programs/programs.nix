{ pkgs, ... }:

{
  # Modern CLI tools
  programs.bat.enable = true; # better `cat`
  programs.eza.enable = true; # modern `ls`
  programs.direnv.enable = true; # project-local envs

  # Core dev tooling
  programs.git.enable = true; # full config lives in programs/git.nix
  programs.gpg.enable = true;
  programs.ssh.enable = true;

  # Quality of life
  programs.man.enable = true; # improved manpages
  programs.less.enable = true; # pager config
  programs.readline.enable = true; # better line editing/history

  programs.uv.enable = true;
}
