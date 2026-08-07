{pkgs, ...}:

{
  home.packages = with pkgs; [
    hyprshot
    wofi
    alacritty
    cliphist
    pavucontrol
    pipewire
    wireplumber
    wl-clipboard
    mesa
  ];

  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
    };
  };

  wayland.windowManager.hyprland = {
    systemd.enable = false;
    enable = true;
  }; 
  home.file.".config/hypr/hyprland.lua".source = builtins.toString ../hypr/configs/hyprland.lua;
  programs.waybar = {
    enable = true;
  };
  xdg.configFile."waybar/config.jsonc".source = builtins.toString ../hypr/configs/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = builtins.toString ../hypr/configs/waybar/style.css;

  xdg.configFile."wofi/style.css".source = builtins.toString ../hypr/configs/wofi/style.css;
  xdg.configFile."wofi/config".source = builtins.toString ../hypr/configs/wofi/config;
}
