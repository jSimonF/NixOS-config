#!/bin/sh

# Update flake
nix flake update .
nixos-rebuild switch --flake .

# Push updated flake
git add *
git commit -m "Updated flake"
git push
