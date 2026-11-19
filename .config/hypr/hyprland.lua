hl.monitor({
    output = "eDP-1",
    mode = "1440x900@59.99600",
    position = "1650x0",
    scale = "1",
})

hl.monitor({
    output = "DP-1",
    mode = "1680x1050@59.95400",
    position = "0x0",
    scale = "1",
})

-- Audio

-- Execute your favorite apps at launch

-- laptop screen off when closed and monitor connected
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("sh -c '[ $(hyprctl monitors | grep -c ^Monitor) -gt 1 ] && hyprctl keyword monitor \"eDP-1, disable\"'"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl keyword monitor \"eDP-1, preferred, auto, 1\""), { locked = true })

-- Set programs that you use
local terminal = "kitty"
local menu = "rofi -show drun -theme ~/.config/rofi/style.rasi"

-- Some default env vars.
hl.env("XCURSOR_SIZE", "24")
-- env = QT_QPA_PLATFORMTHEME,qt6ct # change to qt6ct if you have that

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("waybar & disown"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("killall waybar"))

local backDown = "xbacklight -10"
local backUp = "xbacklight +10"
local kbdDown = "xbacklight -ctrl smc::kbd_backlight -10"
local kbdUp = "xbacklight -ctrl smc::kbd_backlight +10"

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(backDown))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(backUp))
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd(kbdDown))
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd(kbdUp))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -10%"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +10%"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl -- set-source-mute 0 toggle"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 70, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -70, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -70, relative = true }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 70, relative = true }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd("zathura"))

hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("~/.config/hypr/screenshot.sh"))

hl.layer_rule({
    match = { namespace = "waybar" },
		blur = true,
		blur_popups = true,
})

hl.layer_rule({
    match = { namespace = "rofi" },
		blur = true,
		blur_popups = true,
})

hl.layer_rule({
    match = { namespace = "match:namespace waybar" },
    ignore_alpha = 0.1,
})

hl.layer_rule({
    match = { namespace = "match:namespace rofi" },
    ignore_alpha = 0.5,
})

hl.bind(mainMod .. " + SHIFT + f", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-mauve-cursors")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("XCURSOR_THEME", "catppuccin-mocha-mauve-cursors")

-- Fixing zathura blur
hl.env("GDK_WAYLAND_DISABLE","ext_background_effect_manager_v1")

-- TODO: manual review — malformed env on line 212: SDL_VIDEODRIVER=x11

hl.window_rule({
    match = {
        class = "zen",
    },
    opacity = 0.999,
})

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        touchpad = {
            natural_scroll = true,
        },
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    },
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = 0xffc182ff,
            inactive_border = 0xffc182ff,
        },
        layout = "dwindle",
        allow_tearing = false,
    },
    decoration = {
        rounding = 13,
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            popups = true,
        },
        --    drop_shadow = no 
        --    shadow_range = 4
        --    shadow_render_power = 3
        --    col.shadow = rgba(1a1a1aee)
    },
    animations = {
        enabled = true,
    },
    dwindle = {
        preserve_split = true, -- you probably want this
    },
    misc = {
        disable_hyprland_logo = true,
        -- exec = swaybg -i ~/images/backgrounds/man.png
    },
    -- Brightness, volume and keyboard backlight control
    -- Move focus with mainMod + arrow keys
    -- Switch workspaces with mainMod + [0-9]
    -- Move active window to a workspace with mainMod + SHIFT + [0-9]
    -- Example special workspace (scratchpad)
    -- Scroll through existing workspaces with mainMod + scroll
    -- Move/resize windows with mainMod + LMB/RMB and dragging
    -- Move/resize windows with keyboard shortcuts
    -- Calling zathura with shortcut
    -- Screenshots with grim
    -- Blurring rofi and waybar correctly
    -- Fullscreen toggle
    -- Cursor configuration
    -- Blurring zen browser correctly
})

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("pipewire")
    hl.exec_cmd("wireplumber")
    hl.exec_cmd("pipewire-pulse")
    hl.exec_cmd("waybar")
    hl.exec_cmd("xbacklight 30")
    hl.exec_cmd("hypridle")
end)
hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i ~/images/backgrounds/BerkerkDed.jpeg")
end)
hl.on("config.reloaded", function()
    hl.exec_cmd("swaybg -i ~/images/backgrounds/BerkerkDed.jpeg")
end)

hl.config({
	quirks = {
		skip_non_kms_dmabuf_formats = false,
	},
})
