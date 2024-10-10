{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python3
  ];
}
