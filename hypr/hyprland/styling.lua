require("hyprland.variables")

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        font_family = "0xProto Nerd Font",
    },
    general = {
        gaps_in = 4,
        gaps_out = 4,
        border_size = 1,
        col = {
            active_border = "#FAFAFAAA",
            inactive_border = "#595959aa",
        }
    },
    decoration = {
        rounding = radius,
        rounding_power = 2,
        -- Opacity
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        
        shadow = {
            enabled = true,
            range = 8,
            render_power = 3,
            color = "#1a1a1aee"
        },

        blur = {
            enabled = true,
            size = 2,
            passes = 3,
            vibrancy = 0.1696,
            noise = 0.0
        }
    },
    group = {
        groupbar = {
            font_size = 14
        }
    }
})
