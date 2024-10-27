{ config, pkgs, lib, ...}:

{

  home.packages = with pkgs; [
    R
    rstudio
  ];
  
}
