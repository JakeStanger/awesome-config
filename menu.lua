local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")

local function show_help()
    hotkeys_popup.show_help(nil, awful.screen.focused())
end

awesome_menu = {
    {"hotkeys",show_help}, 
    -- {"manual", terminal .. " -e man awesome"},
    -- {"edit config", editor .. " " .. awesome.conffile},
    {"restart", awesome.restart}, 
    {"quit", function() awesome.quit() end}
}

main_menu = awful.menu({
    items = {
        {"awesome", awesome_menu, beautiful.awesome_icon},
        {"open terminal", terminal}
    }
})

return main_menu