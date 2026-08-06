---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"
local browser     = "firefox"




---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)

hl.bind(mainMod .. " + M", function()       -- alternative way to exit hyprland because original bind did not work
    if os.execute("command -v hyprshutdown >/dev/null 2>&1") == 0 then
        hl.dispatch(hl.dsp.exec_cmd("hyprshutdown"))
    else
        hl.dispatch(hl.dsp.exit())
    end
end)

hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw")) -- Notification center


hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }))

hl.bind(mainMod .. " + escape", hl.dsp.exec_cmd("/home/falco/.config/waybar/scripts/powermenu.sh"))
hl.bind(mainMod .. " + CTRL + R", hl.dsp.exec_cmd("/home/falco/.config/hypr/scripts/reload.sh"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("kitty --class floating_bluetooth -e bluetui")) -- Open bluetui in a floating Kitty window
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd("localsend"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("kitty --class floating_btop -e btop")) -- Open btop in a floating Kitty window
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("kitty --class floating_wifi -e wlctl")) -- Tpen wlctl in a floating Kitty window

hl.bind(mainMod .. " + ALT + S", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-sunset.sh")) -- Toggle blue light filter


--screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region -o /home/falco/Pictures/Screenshots"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -o /home/falco/Pictures/Screenshots"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m output -o /home/falco/Pictures/Screenshots"))



-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Swap active window with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))

-- Resize active window horizontally with mainMod + ^ and mainMod + $
hl.bind(mainMod .. " + dead_circumflex", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + dollar",          hl.dsp.window.resize({ x =  30, y = 0, relative = true }), { repeating = true })
-- Resize active window vertically with mainMod + SHIFT + ^ and mainMod + SHIFT + $
hl.bind(mainMod .. " + SHIFT + dead_circumflex", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + dollar",          hl.dsp.window.resize({ x = 0, y =  30, relative = true }), { repeating = true })



-- Cycle focus forward through monitors
hl.bind("CTRL + ALT + Tab", hl.dsp.focus({ monitor = "+1" }))
-- Cycle focus backwards through monitors
hl.bind("CTRL + ALT + SHIFT + Tab", hl.dsp.focus({ monitor = "-1" }))

-- Switch workspaces with mainMod + AZERTY keys (1-10)
-- Move active window to a workspace with mainMod + SHIFT + AZERTY keys
local workspace_keys = {
    "ampersand",   -- Workspace 1
    "eacute",      -- Workspace 2
    "quotedbl",    -- Workspace 3
    "apostrophe",  -- Workspace 4
    "parenleft",   -- Workspace 5
    "section",     -- Workspace 6
    "egrave",      -- Workspace 7
    "exclam",      -- Workspace 8
    "ccedilla",    -- Workspace 9
    "agrave",      -- Workspace 10
}
for i, key in ipairs(workspace_keys) do
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ASUS button
hl.bind("XF86Launch3", hl.dsp.exec_cmd("rog-control-center"))
