{ config, pkgs, lib, ... }:

{

  imports = [
    ./user/wm/hyprland.nix
    ./user/app/nvim/neovim.nix
    ./user/app/emacs/emacs.nix
    ./user/lang/R/R.nix
    ./user/lang/julia/julia.nix
    ./user/lang/python/python.nix
    ./user/lang/haskell/haskell.nix
  ];

  home.username = "simon";
  home.homeDirectory = "/home/simon";

  home.stateVersion = "24.05"; # Please read the comment before changing.
  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  nixpkgs.config.allowUnfree = true;  

  home.packages = with pkgs; [
    nixfmt-classic
    discord
    gcc
    blueman
    kanshi
    gimp
    komikku
    zathura
    obsidian
    nwg-dock-hyprland
  ];

  services.blueman-applet.enable = true;

  stylix = {
    autoEnable = false;
    
    targets.firefox.enable = true;
    targets.gtk.enable = true;
    targets.kitty.enable = true;
    targets.emacs.enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./wallpapers/gengar.jpg;
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji-blob-bin;
      };
      sizes = {
      terminal = 15;
      applications = 12;
      popups = 12;
      desktop = 12;
    };
    };
  };

  gtk = {
    enable = true;
    iconTheme.package = pkgs.papirus-icon-theme;
    iconTheme.name = "Papirus-Dark";
    cursorTheme.package = pkgs.catppuccin-cursors.mochaLight;
    cursorTheme.name = "catppuccin-mocha-light-cursors";
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = lib.mkForce "0.85";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
    };
    initExtra = ''  
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme  
      test -f ~/.config/zsh/.p10k.zsh && source ~/.config/zsh/.p10k.zsh

      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
        dbus-run-session Hyprland
      fi

      export PATH="$HOME/.config/emacs/bin:$PATH"
    '';
  };

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    pictures = "${config.home.homeDirectory}/Media/Pictures";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
      XDG_NOTES_DIR = "${config.home.homeDirectory}/Notes";
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    settings = [

      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1080@60.01Hz";
            scale = 1.0;
          }
        ];
      }

      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
            mode = "1920x1080@60.01Hz";
          }
          {
            criteria = "LG Electronics LG HDR WQHD 0x00061FA5";
            status = "enable";
            mode = "3440x1440@59.97Hz";
          }
        ];
      }
      {
        profile.name = "other";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1080@60.01Hz";
            scale = 1.0;
          }
          {
            criteria = "*";
            status = "enable";
            mode = "1920x1080@60.00Hz";
          }
        ];
      }
    ];
  };
}
