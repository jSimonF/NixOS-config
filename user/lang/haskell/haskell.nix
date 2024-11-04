{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Haskell
      haskellPackages.haskell-language-server
      haskellPackages.stack
      haskellPackages.ghc_9_10_1
  ];
}
