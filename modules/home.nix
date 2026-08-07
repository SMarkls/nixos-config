{pkgs, ...}:

{
  imports = [
    ./hypr/hypr-required.nix
  ];

  home.packages = with pkgs; [
    vlc
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16;
        normal = {
          family = "IosevkaTermSlabNerdFontPropo";
          style = "Regular";
        };
      };
    };
  };

  programs.git = {
    enable = true;
    settings.user = {
      email = "isxakov.mark@gmail.com";
      name = "Марк Исхаков";
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    siteFunctions = {
      n = ''
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d "" cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
      '';
    };
    shellAliases = {
      py = "python3";
      nv = "nvim";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "pmcgee";
    };
  };
  programs.yazi.enable = true;
  home.stateVersion = "26.05";
}

