
-- ============================================================
-- KEYBINDS
-- ============================================================

-- Applications
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen"))
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("CTRL + ALT + DELETE", hl.dsp.exit())

hl.bind(
    "SUPER + D",
    hl.dsp.exec_cmd("pkill wofi || wofi --show drun")
)

hl.bind("SUPER + E", hl.dsp.exec_cmd("thunar"))

hl.bind(
    "SUPER + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region")
)

hl.bind(
    "SUPER + V",
    hl.dsp.exec_cmd(
        "cliphist list | wofi --dmenu --pre-display-cmd \"echo '%s' | cut -f 2'\" | cliphist decode | wl-copy"
    )
)


-- ============================================================
-- FOCUS
-- ============================================================

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))

hl.bind("SUPER + left",  hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "u" }))


-- ============================================================
-- MOVE / SWAP WINDOWS
-- ============================================================

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))

hl.bind(
    "SUPER + SHIFT + left",
    hl.dsp.window.move({ direction = "l" })
)

hl.bind(
    "SUPER + SHIFT + right",
    hl.dsp.window.move({ direction = "r" })
)

hl.bind(
    "SUPER + SHIFT + down",
    hl.dsp.window.move({ direction = "d" })
)

hl.bind(
    "SUPER + SHIFT + up",
    hl.dsp.window.move({ direction = "u" })
)


-- ============================================================
-- FULLSCREEN / FLOATING
-- ============================================================

hl.bind(
    "SUPER + SHIFT + F",
    hl.dsp.window.fullscreen({ action = "toggle" })
)

hl.bind(
    "SUPER + SPACE",
    hl.dsp.window.float({ action = "toggle" })
)


-- ============================================================
-- WORKSPACES
-- ============================================================

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))

hl.bind(
    "SUPER + SHIFT + 1",
    hl.dsp.window.move({ workspace = "1" })
)

hl.bind(
    "SUPER + SHIFT + 2",
    hl.dsp.window.move({ workspace = "2" })
)

hl.bind(
    "SUPER + SHIFT + 3",
    hl.dsp.window.move({ workspace = "3" })
)

hl.bind(
    "SUPER + SHIFT + 4",
    hl.dsp.window.move({ workspace = "4" })
)


-- ============================================================
-- RESIZE
-- ============================================================

hl.bind(
    "SUPER + CTRL + left",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + right",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + up",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + down",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + H",
    hl.dsp.window.resize({ x = -50, y = 0, relative = true }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + L",
    hl.dsp.window.resize({ x = 50, y = 0, relative = true  }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + K",
    hl.dsp.window.resize({ x = 0, y = -50, relative = true  }),
    { repeating = true }
)

hl.bind(
    "SUPER + CTRL + J",
    hl.dsp.window.resize({ x = 0, y = 50, relative = true  }),
    { repeating = true }
)


-- ============================================================
-- MOUSE
-- ============================================================

hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


-- ============================================================
-- INPUT
-- ============================================================

hl.config({
    input = {
        kb_layout = "us,ru",
        repeat_delay = 200,
        repeat_rate = 50,
    },

    misc = {
        middle_click_paste = false,
    },
    decoration = {
      inactive_opacity = 1.0,
      active_opacity = 1.0,
      dim_modal = false,
      dim_strength = 0,
      blur = {
        enabled = false
      },
      shadow = {
        enabled = false
      }
    }
})


-- ============================================================
-- WINDOW RULES
-- ============================================================

hl.window_rule({
    match = {
        class = "^wofi$",
    },
    float = true,
})


-- ============================================================
-- AUTOSTART
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-paste --watch cliphist store")
end)


-- ============================================================
-- ANIMATIONS
-- ============================================================

-- Disable individual animation scopes.
-- Modern Hyprland's Lua API expects an animation leaf.
hl.animation({
    leaf = "windows",
    enabled = false,
})

hl.animation({
    leaf = "workspaces",
    enabled = false,
})

hl.animation({
    leaf = "fade",
    enabled = false,
})

hl.animation({
    leaf = "layers",
    enabled = false,
})


hl.workspace_rule({workspace = "r[1-4]", decorate = false, no_rounding = true, gaps_in = 0, gaps_out = 0, border_size = 1})

