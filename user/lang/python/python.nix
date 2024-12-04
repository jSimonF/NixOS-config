{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      (pkgs.python312.withPackages (ppkgs: [
      ppkgs.numpy
      ppkgs.matplotlib
      ]))

      # matplotlib dependencies
      glib
      zlib
      libGL
      fontconfig
      xorg.libX11
      libxkbcommon
      freetype
      dbus
      libGLU
  ];
}
