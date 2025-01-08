#!/bin/sh

# Update flake
sudo nix flake update --flake .
sudo nixos-rebuild switch --flake .
home-manager switch --flake .

# Push updated flake
git add *
git commit -m "Updated flake"
git push
