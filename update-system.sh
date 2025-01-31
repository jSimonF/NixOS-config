#!/bin/sh

# Update flake
sudo nix flake update --flake .
sudo nixos-rebuild switch --flake .
home-manager switch --flake .

