require("hyprland.keybinds")
require("hyprland.windowrules")
require("hyprland.autostart")
require("hyprland.keyboard")
require("hyprland.styling")
require("hyprland.animations")

hl.monitor({
    scale = 1,
    output = ""
})

hl.config({
    misc = {

        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true
    },
    general = {
        layout = "dwindle",
        allow_tearing = false,
        resize_on_border = true,
    },
    xwayland = {
        force_zero_scaling = true
    },

    -- Layouts
    master = {
        new_status = master
    },
    dwindle = {
        preserve_split = true
    }
})
