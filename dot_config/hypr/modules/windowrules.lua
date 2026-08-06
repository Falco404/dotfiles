--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})



hl.window_rule({    -- firefox always workspace 1
    match = { class = "firefox" },
    workspace = 1,
})



hl.window_rule({
    -- ROG control center always floating
    match = { class = "org.opengamingcollective.rog-control-center" },
    float = true,
    center = true,
})

-- Always open bluetui as a centered floating window
hl.window_rule({
    match = { class = "floating_bluetooth" },
    float = true,
    center = true,
})

hl.window_rule({
    match = { class = "localsend" },
    float = true,
    center = true,
})

-- Force the floating_btop instance to always float and center
hl.window_rule({
    match = { class = "floating_btop" },
    float = true,
    center = true,
})

-- Force floating Wi-Fi window rules
hl.window_rule({
    match = { class = "floating_wifi" },
    float = true,
    center = true,
})