{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    fd
    shellcheck
    pandoc
    ispell
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
  };

}
