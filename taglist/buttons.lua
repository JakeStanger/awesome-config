local gears = require("gears")
local awful = require("awful")

local function move(t)
    if client.focus then client.focus:move_to_tag(t) end
end

local function toggle(t)
    if client.focus then client.focus:toggle_tag(t) end
end

local function view_next(t)
    awful.tag.viewnext(t.screen)
end

local function view_prev(t) 
    awful.tag.viewprev(t.screen)
end

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({modkey}, 1, move), 
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({modkey}, 3, toggle), 
    awful.button({}, 4, view_next),
    awful.button({}, 5, view_prev)
)

return taglist_buttons