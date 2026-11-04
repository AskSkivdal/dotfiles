

hl.window_rule({
    name = "Supress maximize",
    match = {
        class = ".*",
    },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "hover-pavucontrol",
    match = {
        class = 'org.pulseaudio.pavucontrol',
    },
    float = true,
    stay_focused = true,
    size = {"30%", "90%"}
})


-- Smart borders
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
