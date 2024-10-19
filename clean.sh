#!/bin/sh

nix-collect-garbage --delete-older-than 7d

/run/current-system/bin/switch-to-configuration boot
