{ pkgs, config, lib, ... }:

pkgs.stdenv.mkDerivation {
  pname = "digiflisp";
  version = "VERSION";

  src = pkgs.fetchurl {
    url = "http://www.gbgmv.se/dl/linux/digiflisp_2.06.tar.gz";
    sha256 = "1vxk5yj79brjlfd5c4hjqpnspxrr0v4sja1r94mydvcmrskw8z4x";
  };

  nativeBuildInputs = [ pkgs.autoPatchelfHook ];

  installPhase = ''
    mkdir -p $out/bin
    tar -xzvf $src --strip-components=1 -C $out/bin
  '';
}
