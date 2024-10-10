{ config, pkgs, lib, ...}:

{
  home.packages = with pkgs.python312Packages; [
    numpy
    scipy
  ];
}
