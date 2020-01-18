local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

function focus_next()
  awful.client.focus.byidx(1)
end

function focus_prev() 
  awful.client.focus.byidx(-1)
end

function show_menu() 
  mymainmenu:show()
end

function swap_next()
  awful.client.swap.byidx(1)
end

function swap_prev() 
  awful.client.swap.byidx(-1)
end

function focus_next()
  awful.screen.focus_relative(1)
end

function focus_prev()
  awful.screen.focus_relative(-1)
end

function swap()
  awful.client.focus.history.previous()
  if client.focus then client.focus:raise() end
end

function open_terminal()
  awful.spawn(terminal)
end

function increase_master_width()
  awful.tag.incmwfact(0.05)
end

function decrease_master_width()
  awful.tag.incmwfact(-0.05)
end

function increase_master_clients()
  awful.tag.incnmaster(1, nil, true)
end

function decrease_master_clients()
  awful.tag.incnmaster(-1, nil, true)
end

function increase_cols()
  awful.tag.incncol(1, nil, true)
end

function decrease_cols()
  awful.tag.incncol(-1, nil, true)
end

function next_layout()
  awful.layout.inc(1)
end

function prev_layout()
  awful.layout.inc(-1)
end

function restore_minimised()
  local c = awful.client.restore()
  -- Focus restored client
  if c then
      c:emit_signal("request::activate", "key.unminimize", {raise = true})
  end
end

function run_prompt()
  awful.screen.focused().mypromptbox:run()
end

function run_lua_prompt()
  awful.prompt.run{
    prompt = "Run Lua code: ",
    textbox = awful.screen.focused().mypromptbox.widget,
    exe_callback = awful.util.eval,
    history_path = awful.util.get_cache_dir() .. "/history_eval"
  }
end

function rofi_launcher()
  awful.util.spawn("rofi-appsmenu")
end

function launch_filemanager()
  awful.util.spawn("nautilus -w")
end

function launch_rofi_mpd()
  awful.util.spawn("rofi-mpd")
end

function launch_rofi_mpd_mediaserver()
  awful.util.spawn("rofi-mpd -c media-server")
end

function screenshot()
  awful.util.spawn("/home/jake/bin/maim-area")
end

globalkeys = gears.table.join(
  awful.key({modkey}, "s", hotkeys_popup.show_help, {
    description = "show help",
    group = "awesome"
  }), 
  awful.key({modkey}, "Left", awful.tag.viewprev, {
    description = "view previous", group = "tag"
  }),
  awful.key({modkey}, "Right", awful.tag.viewnext, {
    description = "view next",
    group = "tag"
  }), 
  awful.key({modkey}, "Escape", awful.tag.history.restore, {
    description = "go back", 
    group = "tag"
  }),
  awful.key({modkey}, "j", focus_next, {
    description = "focus next by index", 
    group = "client"
  }),
  awful.key({modkey}, "k", focus_prev, {
    description = "focus previous by index", 
    group = "client"
  }),
  awful.key({modkey}, "w", show_menu, {
    description = "show main menu",
    group = "awesome"
  }),

  -- Layout manipulation
  awful.key({modkey, "Shift"}, "j", swap_next, {
    description = "swap with next client by index", 
    group = "client"
  }),
  awful.key({modkey, "Shift"}, "k", swap_prev, {
    description = "swap with previous client by index", 
    group = "client"
  }),
  awful.key({modkey, "Control"}, "j", focus_next, {
    description = "focus the next screen", 
    group = "screen"
  }),
  awful.key({modkey, "Control"}, "k", focus_prev, {
    description = "focus the previous screen", 
    group = "screen"
  }),
  awful.key({modkey}, "u", awful.client.urgent.jumpto, {
    description = "jump to urgent client",
    group = "client"
  }), 
  awful.key({modkey}, "Tab", swap, {
    description = "go back", 
    group = "client"
  }), 
  
  -- Standard program
  awful.key({modkey}, "Return", open_terminal, {
    description = "open a terminal", 
    group = "launcher"
  }),
  awful.key({modkey, "Control"}, "r", awesome.restart, {
      description = "reload awesome",
      group = "awesome"
  }), 
  awful.key({modkey, "Shift"}, "q", awesome.quit, {
    description = "quit awesome", 
    group = "awesome"
  }),
  awful.key({modkey}, "l", increase_master_width, {
    description = "increase master width factor", 
    group = "layout"
  }),
  awful.key({modkey}, "h", decrease_master_width, {
    description = "decrease master width factor", 
    group = "layout"
  }),
  awful.key({modkey, "Shift"}, "h", increase_master_clients, {
    description = "increase the number of master clients", 
    group = "layout"
  }),
  awful.key({modkey, "Shift"}, "l", decrease_master_clients, {
    description = "decrease the number of master clients", 
    group = "layout"
  }),
  awful.key({modkey, "Control"}, "h", increase_cols, {
    description = "increase the number of columns", 
    group = "layout"
  }),
  awful.key({modkey, "Control"}, "l", decrease_cols, {
    description = "decrease the number of columns", 
    group = "layout"
  }),
  awful.key({modkey}, "space", next_layout, {
    description = "select next",
    group = "layout"
  }), 
  awful.key({modkey, "Shift"}, "space", prev_layout, {
    description = "select previous", 
    group = "layout"
  }),
  awful.key({modkey, "Control"}, "n", restore_minimised, {
    description = "restore minimized", 
    group = "client"
  }), 
  
  -- Prompt
  awful.key({modkey}, "r", run_prompt, {
    description = "run prompt", 
    group = "launcher"
  }),
  awful.key({modkey}, "x", run_lua_prompt, {
    description = "lua execute prompt", 
    group = "awesome"
  }), 
  
  -- Launchers
  awful.key({modkey}, "a", rofi_launcher, {
    description = "show rofi", 
    group = "launcher"
  }),
  awful.key({modkey}, "e", launch_filemanager, {
    description = "launch file manager",
    group = "launcher"
  }),
  awful.key({"Control", "Shift"}, "#", launch_rofi_mpd, {
    description = "launch rofi-mpd",
    group = "launcher"
  }), 
  awful.key({"Control", "Shift"}, "]", launch_rofi_mpd_mediaserver, {
    description = "launch rofi-mpd for media-server",
    group = "launcher"
  }),

  -- Misc
  awful.key({"Control", "Shift"}, "Print", screenshot, {
    description = "take screenshot of area",
  }),
  awful.key({ }, "XF86AudioNext",function () awful.util.spawn( "mpc -h $(get-mpd-host) next" ) end, {
    description = "next track",
  }),
  awful.key({ }, "XF86AudioPrev",function () awful.util.spawn( "mpc -h $(get-mpd-host) prev" ) end, {
    description = "previous track"
  }),
  awful.key({ }, "XF86AudioPlay",function () awful.util.spawn( "mpc -h $(get-mpd-host) play" ) end, {
    description = "play"
  }),
  awful.key({ }, "XF86AudioStop",function () awful.util.spawn( "mpc -h $(get-mpd-host) pause" ) end, {
    description = "pause"
  })
)

return globalkeys
