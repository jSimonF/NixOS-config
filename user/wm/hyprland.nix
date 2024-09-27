{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprpaper
  ];

 home.file.".config/hypr/hypridle.conf".text = ''
  general {
    lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
    before_sleep_cmd = loginctl lock-session    # lock before suspend.
    after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
  }

  listener {
    timeout = 150                                # 2.5min.
    on-timeout = brightnessctl -s set 10         # set monitor backlight to minimum, avoid 0 on OLED monitor.
    on-resume = brightnessctl -r                 # monitor backlight restore.
  }


  listener {
    timeout = 300                                 # 5min
    on-timeout = loginctl lock-session            # lock screen when timeout has passed
  }

  listener {
    timeout = 330                                 # 5.5min
    on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
    on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
  }

  listener {
    timeout = 1800                                # 30min
    on-timeout = systemctl suspend                # suspend pc
  }
  '';

  home.file.".config/hypr/hyprlock.conf".text = ''
    # BACKGROUND
    background {
      monitor =
      path = ~/.dotfiles/wallpapers/gengar.jpg
      blur_passes = 3
      contrast = 0.8916
      brightness = 0.8172
      vibrancy = 0.1696
      vibrancy_darkness = 0.0
    }

    # GENERAL
      general {
      no_fade_in = false
      grace = 0
      disable_loading_bar = true
    }

    # INPUT FIELD
      input-field {
        monitor =
        size = 250, 60
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgba(0, 0, 0, 0)
        inner_color = rgba(0, 0, 0, 0.5)
        font_color = rgb(200, 200, 200)
        fade_on_empty = false
        placeholder_text = <i><span foreground="##cdd6f4">Input Password...</span></i>
        hide_input = false
        position = 0, -120
        halign = center
        valign = center
    }

    # TIME
      label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%-I:%M%p")"
        #color = rgba(255, 255, 255, 0.6)
        font_size = 120
        font_family = JetBrains Mono Nerd Font Mono ExtraBold
        position = 0, -300
        halign = center
        valign = top
    }
    
    # USER
    label {
      monitor =
      text = Hi there, $USER
      #color = rgba(255, 255, 255, 0.6)
      font_size = 25
      font_family = JetBrains Mono Nerd Font Mono
      position = 0, -40
      halign = center
      valign = center
    }
  '';

  home.file.".config/hypr/hyprpaper.conf".text = ''
  preload = ~/.dotfiles/wallpapers/gengar.jpg
  wallpaper =, ~/.dotfiles/wallpapers/gengar.jpg
  '';
}
