{ dotfiles, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim".source = "${dotfiles}/.config/nvim";
}
