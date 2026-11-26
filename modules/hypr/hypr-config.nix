{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    systemd.enable = false;
    configType = "lua";
    settings = {
      monitor = {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      };

      config = {
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 1;
        };

        decoration = {
          inactive_opacity = 1.0;
          active_opacity = 1.0;
          dim_modal = false;
          dim_strength = 0;
          blur = {
            enabled = false;
          };
          shadow = {
            enabled = false;
          };
        };

        input = {
          kb_layout = "us,ru";
          kb_options = "grp:alt_shift_toggle";
          repeat_rate = 50;
          repeat_delay = 200;
          follow_mouse = 1;
        };

        misc = {
          middle_click_paste = false;
          disable_hyprland_logo = true;
        };

        animations = {
          enabled = false;
        };
      };

      bind = [
        {
          _args = [
            "SUPER + B"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('xdg-open https://google.com')")
          ];
        }
        {
          _args = [
            "SUPER + RETURN"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('alacritty')")
          ];
        }
        {
          _args = [
            "SUPER + Q"
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
          ];
        }
        {
          _args = [
            "CTRL + ALT + DELETE"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('loginctl terminate-user $USER')")
          ];
        }
        {
          _args = [
            "SUPER + D"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('pkill wofi || wofi --show drun')")
          ];
        }
        {
          _args = [
            "SUPER + E"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('thunar')")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + S"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('hyprshot -m region')")
          ];
        }
        {
          _args = [
            "SUPER + V"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd('cliphist list | wofi --dmenu --pre-display-cmd \\'echo %s | cut -f 2\\' | cliphist decode | wl-copy')")
          ];
        }
        {
          _args = [
            "SUPER + H"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'left' })")
          ];
        }
        {
          _args = [
            "SUPER + L"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'right' })")
          ];
        }
        {
          _args = [
            "SUPER + J"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'down' })")
          ];
        }
        {
          _args = [
            "SUPER + K"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'up' })")
          ];
        }
        {
          _args = [
            "SUPER + left"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'left' })")
          ];
        }
        {
          _args = [
            "SUPER + right"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'right' })")
          ];
        }
        {
          _args = [
            "SUPER + down"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'down' })")
          ];
        }
        {
          _args = [
            "SUPER + up"
            (lib.generators.mkLuaInline "hl.dsp.focus({ direction = 'up' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + H"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'left' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + L"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'right' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + J"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'down' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + K"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'up' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + left"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'left' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + right"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'right' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + down"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'down' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + up"
            (lib.generators.mkLuaInline "hl.dsp.window.swap({ direction = 'up' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + F"
            (lib.generators.mkLuaInline "hl.dsp.window.fullscreen()")
          ];
        }
        {
          _args = [
            "SUPER + SPACE"
            (lib.generators.mkLuaInline "hl.dsp.window.float({ action = 'toggle' })")
          ];
        }
        {
          _args = [
            "SUPER + 1"
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = '1' })")
          ];
        }
        {
          _args = [
            "SUPER + 2"
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = '2' })")
          ];
        }
        {
          _args = [
            "SUPER + 3"
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = '3' })")
          ];
        }
        {
          _args = [
            "SUPER + 4"
            (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = '4' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + 1"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = '1' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + 2"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = '2' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + 3"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = '3' })")
          ];
        }
        {
          _args = [
            "SUPER + SHIFT + 4"
            (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = '4' })")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + left"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + right"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + up"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + down"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + H"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = -50, y = 0, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + L"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 50, y = 0, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + K"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = -50, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + CTRL + J"
            (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = 50, relative = true })")
            (lib.generators.mkLuaInline "{ repeating = true }")
          ];
        }
        {
          _args = [
            "SUPER + mouse:272"
            (lib.generators.mkLuaInline "hl.dsp.window.drag()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
        {
          _args = [
            "SUPER + mouse:273"
            (lib.generators.mkLuaInline "hl.dsp.window.resize()")
            (lib.generators.mkLuaInline "{ mouse = true }")
          ];
        }
        {
          _args = [
            "XF86MonBrightnessUp"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl set 5%+\")")
          ];
        }
        {
          _args = [
            "XF86MonBrightnessDown"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"brightnessctl set 5%-\")")
          ];
        }
      ];

      workspace_rule = [
        {
          workspace = "r[1-4]";
          decorate = false;
          no_rounding = true;
          gaps_in = 0;
          gaps_out = 0;
          border_size = 1;
        }
      ];

      window_rule = {
        match = {
          class = "^wofi$";
        };
        float = true;
      };

      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("waybar")
              hl.exec_cmd("swaync")
              hl.exec_cmd("wl-paste --watch cliphist store")
              hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
            end
          '')
        ];
      };
    };
  };

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        height = 30;
        spacing = 0;
        exclusive = true;

        "modules-left" = [
          "custom/start"
          "custom/separator"
          "custom/pin-terminal"
          "custom/pin-browser"
          "custom/pin-files"
          "custom/separator"
        ];

        "modules-center" = [
          "wlr/taskbar"
        ];

        "modules-right" = [
          "tray"
          "hyprland/language"
          "bluetooth"
          "custom/separator-tray"
          "pulseaudio"
          "network"
          "battery"
          "clock"
        ];

        "custom/start" = {
          format = " Start";
          tooltip = false;
          "on-click" = "pkill wofi || wofi --show drun";
        };

        "custom/separator" = {
          format = " ";
          tooltip = false;
        };

        "custom/separator-tray" = {
          format = "";
          tooltip = false;
        };

        "custom/pin-terminal" = {
          format = "";
          "tooltip-format" = "Terminal";
          "on-click" = "alacritty";
        };

        "custom/pin-browser" = {
          format = "";
          "tooltip-format" = "Browser";
          "on-click" = "zen-browser";
        };

        "custom/pin-files" = {
          format = "";
          "tooltip-format" = "Files";
          "on-click" = "dolphin";
        };

        "wlr/taskbar" = {
          format = "{icon} {name}";
          "icon-size" = 16;
          "tooltip-format" = "{title}";
          "on-click" = "activate";
          "on-click-middle" = "close";
          "on-click-right" = "minimize-raise";
          "app_ids-mapping" = { };
        };

        "tray" = {
          "icon-size" = 14;
          spacing = 4;
        };

        "hyprland/language" = {
          format = "{}";
          "format-en" = "EN";
          "format-ru" = "RU";
        };

        "pulseaudio" = {
          format = " {volume}";
          "format-muted" = " Mute";
          "format-icons" = {
            "default" = [ "" ];
          };
          "on-click" = "pavucontrol";
        };

        "network" = {
          "format-wifi" = "󱚽";
          "format-disconnected" = "";
          "tooltip-format" = "{essid} | {ipaddr}";
          "on-click" = "alacritty -e nmtui";
        };

        "battery" = {
          format = " {capacity}󰁹";
          "format-charging" = " {capacity}󰂄";
          "format-plugged" = " {capacity}󰁹";
          "format-icons" = [ "" ];
        };

        "bluetooth" = {
          format = "󰂯";
          "on-click" = "blueman-manager";
        };

        "clock" = {
          format = "{:%H:%M}";
          "format-alt" = "{:%d.%m.%Y %H:%M}";
          "tooltip-format" = "<tt>{calendar}</tt>";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono", "Tahoma", sans-serif;
        font-size: 16px;
        min-height: 0;
        margin: 0;
        padding: 0;
      }

      window#waybar {
        background-color: #c0c0c0;
        color: #000000;
        border-top: 2px solid #ffffff;
      }

      #custom-start {
        background-color: #c0c0c0;
        color: #000000;
        font-weight: bold;
        padding: 2px 6px;
        margin: 2px 0 2px 2px;
        border-top: 2px solid #ffffff;
        border-left: 2px solid #ffffff;
        border-bottom: 2px solid #404040;
        border-right: 2px solid #404040;
      }

      #custom-start:hover {
        background-color: #d4d0c8;
      }

      #custom-start:active {
        border-top: 2px solid #404040;
        border-left: 2px solid #404040;
        border-bottom: 2px solid #ffffff;
        border-right: 2px solid #ffffff;
      }

      #custom-separator {
        color: #808080;
        padding: 0 2px;
        font-size: 11px;
      }

      #custom-separator-tray {
        background-color: transparent;
        min-width: 2px;
        margin: 3px 2px;
        border-left: 1px solid #808080;
        border-right: 1px solid #ffffff;
      }

      #custom-pin-terminal,
      #custom-pin-browser,
      #custom-pin-files {
        background-color: transparent;
        color: #000000;
        padding: 2px 4px;
        margin: 2px 0;
        font-size: 14px;
      }

      #custom-pin-terminal:hover,
      #custom-pin-browser:hover,
      #custom-pin-files:hover {
        border-top: 1px solid #ffffff;
        border-left: 1px solid #ffffff;
        border-bottom: 1px solid #808080;
        border-right: 1px solid #808080;
      }

      #taskbar {
        padding: 0 2px;
      }

      #taskbar button {
        background-color: #c0c0c0;
        color: #000000;
        padding: 1px 8px;
        margin: 2px 1px;
        border-top: 2px solid #ffffff;
        border-left: 2px solid #ffffff;
        border-bottom: 2px solid #404040;
        border-right: 2px solid #404040;
        border-radius: 0;
        min-width: 80px;
      }

      #taskbar button:hover {
        background-color: #d4d0c8;
      }

      #taskbar button.active {
        background-color: #c0c0c0;
        font-weight: bold;
        border-top: 2px solid #404040;
        border-left: 2px solid #404040;
        border-bottom: 2px solid #ffffff;
        border-right: 2px solid #ffffff;
      }

      #tray {
        padding: 0 4px;
        margin: 3px 2px;
        border-top: 1px solid #808080;
        border-left: 1px solid #808080;
        border-bottom: 1px solid #ffffff;
        border-right: 1px solid #ffffff;
      }

      #language {
        color: #000000;
        padding: 0 4px;
        font-size: 11px;
        font-weight: bold;
      }

      #pulseaudio,
      #network,
      #battery,
      #clock {
        color: #000000;
        padding: 0 4px;
        margin: 3px 0;
      }

      #pulseaudio.muted {
        color: #808080;
      }

      #network {
        font-size: 16px;
      }

      #network.disconnected {
        color: #808080;
      }

      #bluetooth,
      #battery {
        color: #001960;
      }

      #battery.warning {
        color: #808000;
      }

      #battery.critical {
        color: #800000;
      }

      #clock {
        padding: 0 6px 0 4px;
        margin: 3px 2px 3px 0;
        border-top: 1px solid #808080;
        border-left: 1px solid #808080;
        border-bottom: 1px solid #ffffff;
        border-right: 1px solid #ffffff;
      }

      tooltip {
        background-color: #ffffe1;
        border: 1px solid #000000;
        border-radius: 0;
        color: #000000;
      }

      tooltip label {
        color: #000000;
        font-size: 11px;
      }
    '';
  };

  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
    };
  };

  home.packages = with pkgs; [
    hyprshot
    wofi
    alacritty
    cliphist
    pavucontrol
    wl-clipboard
  ];

  xdg.configFile."wofi/config".source = builtins.toString ./wofi/config;
  xdg.configFile."wofi/style.css".source = builtins.toString ./wofi/style.css;
}
