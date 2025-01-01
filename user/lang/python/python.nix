{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
      # Python setup
      (pkgs.python312.withPackages (ppkgs: [
      ppkgs.numpy
      ppkgs.matplotlib
      ppkgs.gmsh
      ppkgs.scipy
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
      xorg.libXrender
      xorg.libXcursor
      xorg.libXfixes
      xorg.libXft
      fontconfig
      xorg.libXinerama
  ];
}
