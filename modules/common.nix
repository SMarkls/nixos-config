{ inputs, pkgs, yazi, ...}:

{
  imports = [
    ./hypr/hypr.nix
    ./zen-browser.nix
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

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default
    openconnect
    remmina
  ];
  environment.variables.EDITOR = "vim";

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

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
