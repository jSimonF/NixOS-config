{ pkgs, ... }:

{
  home.packages = with pkgs; [
      # Haskell
      haskellPackages.haskell-language-server
      haskellPackages.stack
      haskellPackages.cabal-install
      ghc
  ];
}
