{ pkgs ? import <nixpkgs> {} }:

let
  fetchurl = pkgs.fetchurl;
  runCommand = pkgs.runCommand;
  autoPatchelfHook = pkgs.autoPatchelfHook;
  xorg = pkgs.xorg;
  libxkbcommon = pkgs.libxkbcommon;
  gtk3 = pkgs.gtk3;

  src = fetchurl {
    url = "http://www.gbgmv.se/dl/linux/digiflisp_2.06.tar.gz";
    sha256 = "1vxk5yj79brjlfd5c4hjqpnspxrr0v4sja1r94mydvcmrskw8z4x";
  };

in
{
  # Build digiflisp and qaflisp
  digiflisp = runCommand "digiflisp" {
    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [ xorg.libX11 xorg.libXxf86vm xorg.libSM libxkbcommon gtk3 ];
  } ''
    set -e
    mkdir -p $out/bin
    tar -xvf ${src} -C $out/bin || { echo "Extraction failed"; exit 1; }
    chmod +x $out/bin/*  
    autoPatchelf $out/bin/*
  '';

  qaflisp = runCommand "qaflisp" {
    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [ xorg.libX11 xorg.libXxf86vm xorg.libSM libxkbcommon gtk3 ];
  } ''
    set -e
    mkdir -p $out/bin
    tar -xvf ${src} -C $out/bin || { echo "Extraction failed"; exit 1; }
    chmod +x $out/bin/*  
    autoPatchelf $out/bin/*
  '';
}

