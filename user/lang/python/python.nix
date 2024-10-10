{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      (pkgs.python312.withPackages (ppkgs: [
      ppkgs.numpy
      ]))
  ];
}
