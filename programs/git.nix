{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Julian Irizarry";
    userEmail = "julianirizarry@live.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
      merge.tool = "vimdiff";
      credential.helper = "manager";
      credential.credentialStore = "secretservice";
      core.editor = "vim";
      core.autocrlf = "input";
    };
  };
}
