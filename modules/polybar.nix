{ config, pkgs, ... }:

{
  services = {
    polybar = {
      script = "polybar mybar -r";
      enable = true;
      config = {
        "colors" = {
          background = "#002B36";
          background-alt = "#073642";
          foreground = "#FDF6E3";
          foreground-alt = "#EEE8D5";
          primary = "#2AA198";
          secondary = "#B58900";
          tertiary = "#DC322F";
        };
        "bar/mybar" = {
          background = "\${colors.background}";
          cursor-click = "pointer";
          cursor-scroll = "ns-resize";
          enable-ipc = "true";
          font-0 = "Ubuntu Mono:pixelsize=17;2";
          foreground = "\${colors.foreground}";
          height = "30px";
          module-margin = 1;
          modules-left = "powermenu bspwm";
          modules-center = "date";
          modules-right = "battery";
          override-redirect = "true";
          padding-left = 1;
          padding-right = 1;
          tray-position = "right";
          width = "100%";
          wm-restack = "bspwm";
          separator = "";
        };
        "module/battery" = {
          type = "internal/battery";
          adapter = "ACAD";
          battery = "BAT1";
          format-charging = "<label-charging>";
          format-discharging = "<label-discharging>";
          format-full = "<label-full>";
          format-low = "<label-low>";
          format-low-foreground = "\${colors.tertiary}";
          label-charging = "+%percentage%%";
          label-discharging = "-%percentage%%";
          label-full = "full";
          label-low = "-%percentage%%";
          low-at = 10;
          poll-interval = 5;
        };
        "module/date" = {
          type = "internal/date";
          internal = 5;
          label = "%time%";
          time = "%a %l:%M %P";
        };
        "module/bspwm" = {
          type = "internal/bspwm";
          label-dimmed = " %index% ";
          label-focused = " %index% ";
          label-focused-background = "\${colors.background-alt}";
          label-occupied = " %index% ";
          label-urgent = " %index% ";
          label-empty = " %index% ";
        };
        "module/powermenu" = {
          type = "custom/menu";
          expand-right = true;
          label-open = "pwr";
          label-close = "X";
          label-separator = " ";
          menu-0-0 = "shutdown";
          menu-0-0-exec = "poweroff";
          menu-0-1 = "restart";
          menu-0-1-exec = "reboot";
        };
        "settings" = {
          pseudo-transparency = "true";
          screenchange-reload = "true";
        };
      };
    };
  };
}
