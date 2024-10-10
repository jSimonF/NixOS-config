{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3
  ];

  home.packages = with pkgs.python3Packages; [
      numpy
      scipy
  ];
}
