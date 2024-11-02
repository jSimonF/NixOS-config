{ pkgs, ... }:

let
  digiflisp = pkgs.callPackage ./digiflisp.nix {};
in
{
  environment.systemPackages = with pkgs; [
    digiflisp.digiflisp
    digiflisp.qaflisp
  ];

  # Adding .desktop entries for Rofi
  environment.xdg.applications.digiflisp = ''
    [Desktop Entry]
    Version=1.0
    Name=Digiflisp
    Exec=${digiflisp.digiflisp}/bin/digiflisp
    Icon=/path/to/icon.png  # Adjust as needed
    Type=Application
    Terminal=false
    Categories=Development;IDE;
  '';

  environment.etc.xdg.applications.qaflisp = ''
    [Desktop Entry]
    Version=1.0
    Name=Qaflisp
    Exec=${digiflisp.qaflisp}/bin/qaflisp
    Icon=/path/to/icon.png  # Adjust as needed
    Type=Application
    Terminal=false
    Categories=Development;IDE;
  '';
}

