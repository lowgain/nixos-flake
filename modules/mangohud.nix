{ pkgs, ... }:

{
  programs.mangohud = {
    enable = true;
    settings = {
      background_alpha = "0.4";
      font_size = "24";
      background_color = "002B36";
      text_color = "FDF6E3";
      position = "top-left";
      toggle_hud = "F11";
      time = true;
      time_format = "%a %l:%M %P";
      media_player = true;
      media_player_format = "{title};{artist}";
      font_scale_media_player = 1.05;
      battery_icon = true;
      cpu_stats = 0;
      gpu_stats = 0;
      frame_timing= 0;
    };
    settingsPerApplication = {
      mpv = {
        no_display = false;
      };
      "Terraria.bin.x86_64" = {
        background_alpha = "0.4";
        font_size = "24";
        background_color = "002B36";
        text_color = "FDF6E3";
        position = "top-center";
        toggle_hud = "F11";
        time = true;
        time_format = "%a %l:%M %P";
        media_player = true;
        media_player_format = "{title};{artist}";
        font_scale_media_player = 1.05;
        battery_icon = true;
        cpu_stats = 0;
        gpu_stats = 0;
        frame_timing= 0;
      };
    };
  };
}
