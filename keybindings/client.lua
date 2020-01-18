local gears = require("gears")
local awful = require("awful")

function fullscreen(c)
  c.fullscreen = not c.fullscreen
  c:raise()
end

function close(c)
  c:kill()
end

function move_to_master(c)
  c:swap(awful.client.getmaster())
end

function move_to_screen(c)
  c:move_to_screen()
end

function toggle_keep_on_top(c)
  c.ontop = not c.ontop
end

function minimize(c)
  c.minimized = true
end

function toggle_maximize(c)
  c.maximized = not c.maximized
  c:raise()
end

function toggle_maximize_vertical(c)
  c.maximized_vertical = not c.maximized_vertical
  c:raise()
end

function toggle_maximize_horizontal(c)
  c.maximized_horizontal = not c.maximized_horizontal
  c:raise()
end

clientkeys = gears.table.join(
  awful.key({modkey}, "f",fullscreen, {
    description = "toggle fullscreen", 
    group = "client"
  }),
  awful.key({"Mod1"}, "F4", close, {
    description = "close",
    group = "client"
  }), 
  awful.key({modkey, "Control"}, "space", awful.client.floating.toggle, {
    description = "toggle floating", 
    group = "client"
  }),
  awful.key({modkey, "Control"}, "Return", move_to_master, {
    description = "move to master", 
    group = "client"
  }),
  awful.key({modkey}, "o", move_to_screen, {
    description = "move to screen",
    group = "client"
  }), 
  awful.key({modkey}, "t", toggle_keep_on_top, {
    description = "toggle keep on top", 
    group = "client"
  }),
  awful.key({modkey}, "n", minimize, {
    description = "minimize", 
    group = "client"
  }),
  awful.key({modkey}, "m", toggle_maximize, {
    description = "(un)maximize", 
    group = "client"
  }),
  awful.key({modkey, "Control"}, "m", toggle_maximize_vertical, {
    description = "(un)maximize vertically", 
    group = "client"
  }),
  awful.key({modkey, "Shift"}, "m", toggle_maximize_horizontal, {
    description = "(un)maximize horizontally", 
    group = "client"
  })
)

return clientkeys
