{ pkgs, ... }:

let
  digiflisp = pkgs.callPackage ./digifisp.nix {};
in
{
  environment.systemPackages = with pkgs; [
    digiflisp.digiflisp  # Include digiflisp
    digiflisp.qaflisp    # Include qaflisp
  ];
}

