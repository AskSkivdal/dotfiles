require("hyprland.variables")

-- Programs
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + D", hl.dsp.exec_raw(menu))
hl.bind("SUPER + A", hl.dsp.exec_raw("pavucontrol"))
hl.bind("SUPER + E", hl.dsp.exec_raw(fileManager))
hl.bind("SUPER + P", hl.dsp.exec_raw("hyprpicker -a"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_raw("wayscriber --active"))
-- Broser
hl.bind("SUPER + B", hl.dsp.exec_raw("firefox"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_raw("firefox --private-window"))
-- toggle waybar
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_raw("killall waybar || waybar"))


-- Hyprland actions
hl.bind("CONTROL + ALT + DELETE", hl.dsp.exit())
hl.bind("PRINT", hl.dsp.exec_raw("bash ~/.config/hypr/scripts/grimblast copysave area"))


-- Locks
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_raw('swaylock -c "000000"'))
hl.bind("SUPER + L", hl.dsp.exec_raw("hyprlock"))



-- Window actions
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + CONTROL + SHIFT + Q", hl.dsp.window.kill())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({
    action = "toggle"
}))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({
    action = "toggle"
}))

-- Layout
hl.bind("SUPER + V", hl.dsp.layout("preselect b"))
hl.bind("SUPER + H", hl.dsp.layout("preselect r"))

for i,direction in ipairs({"up", "down", "left", "right"}) do
    hl.bind(
        string.format("SUPER + %s", string.upper(direction)), 
        hl.dsp.focus({direction = direction})
    )
    hl.bind(
        string.format("SUPER + SHIFT + %s", string.upper(direction)), 
        hl.dsp.window.move({direction = direction, group_aware = true})
    )
end

--- Group
hl.bind("SUPER + G", hl.dsp.group.toggle())
hl.bind("SUPER + TAB", hl.dsp.group.next())

-- Workspace actions
for i,v in ipairs({1,2,3,4,5,6,7,8,9}) do
    hl.bind(string.format("SUPER + %s", v), hl.dsp.focus({workspace = v}))
    hl.bind(string.format("SUPER + SHIFT + %s", v), hl.dsp.window.move({workspace = v, follow = false}))
end

--- Special workspaces
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("scratch"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({workspace="special:scratch"}))

-- mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })


-- Utility keymaps
utility_bind_map = {
    XF86AudioRaiseVolume = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+",
    XF86AudioLowerVolume = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    XF86AudioMute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    XF86AudioMicMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    XF86MonBrightnessUp = "brightnessctl -e4 -n2 set 5%+",
    XF86MonBrightnessDown = "brightnessctl -e4 -n2 set 5%-",

    XF86AudioNext = "playerctl next",
    XF86AudioPause = "playerctl play-pause",
    XF86AudioPlay = "playerctl play-pause",
    XF86AudioPrev = "playerctl previous"
}

for key,command in pairs(utility_bind_map) do
    hl.bind(key, hl.dsp.exec_raw(command))
end

-- Resize submap
hl.bind("SUPER + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()

    -- Set repeating binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true}), { repeating = true })

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("SUPER + R", hl.dsp.submap("reset"))

end)
