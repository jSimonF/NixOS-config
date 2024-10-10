{ config, pkgs, lib, ... }:

{

  home.packages = with pkgs; [
    julia-bin
  ];

}
