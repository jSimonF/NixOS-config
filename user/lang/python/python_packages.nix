{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs.python3Packages; [
    numpy
    scipy
  ];
}
