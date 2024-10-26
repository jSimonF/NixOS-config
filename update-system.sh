#!/bin/sh

# Update flake
sudo nix flake update .
sudo nixos-rebuild switch --flake .

# Push updated flake
git add *
git commit -m "Updated flake"
git push
