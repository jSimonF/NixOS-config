{ pkgs, ... }:

let
  digiflisp = pkgs.callPackage ./digiflisp.nix {};
in
{
  environment.systemPackages = with pkgs; [
    digiflisp.digiflisp  # Include digiflisp
    digiflisp.qaflisp    # Include qaflisp
  ];
}

