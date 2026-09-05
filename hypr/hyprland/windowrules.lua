

hl.window_rule({
    name = "Supress maximize",
    match = {
        class = "*",
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
