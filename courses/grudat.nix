{ pkgs, ... }:

let
  digiflisp = pkgs.callPackage ./digiflisp.nix {};
in
{
  environment.systemPackages = with pkgs; [
    digiflisp.digiflisp
    digiflisp.qaflisp
  ];
}

