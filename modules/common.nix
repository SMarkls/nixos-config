{ inputs, pkgs, yazi, ...}:

{
  imports = [
    ./hypr/hypr.nix
    ./bluetooth.nix
    ./vpn.nix
    ./copro-vpn.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    ripgrep
    inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default
    remmina
    freerdp
    bind
    neovim
    v2raya
    xray
    telegram-desktop
  ];

  programs.zsh.enable = true;
  users.users.mark = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkManager"
      "video"
      "render"
      "input"
    ];
    initialPassword = "123456";
  };

  security.sudo.wheelNeedsPassword = true;
  time.timeZone = "Asia/Yekaterinburg";
  environment.variables.EDITOR = "nvim";

  programs.thunar = {
    enable = true;
    plugins =   with pkgs; [
      xfce4-exo
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];
  };

  programs.tmux = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.iosevka-term-slab
  ];

  services.resolved.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
