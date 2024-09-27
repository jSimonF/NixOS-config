{ config, pkgs, lib, ...}:

{
  home.file = {
    ".config/nvim".source = ./nvim-config;
  };

  programs.neovim = {
    enable = true;
    extraWrapperArgs = [
      "--prefix"
      "PATH"
      ":"
      "${lib.makeBinPath [ pkgs.gcc ]}"
    ];
  };
}
