{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      python312
      (pkgs.python312.withPackages (ppkgs: [
      numpy
      ]))
  ];
}
