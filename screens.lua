local awful = require("awful")
layout_suit = awful.layout.suit

screens = {
    { 
        tags = {"1", "2", "3"},
        layout = layout_suit.floating
    },
    {
        tags = {"1"},
        layout =layout_suit.spiral
    },
    {
        tags = {""},
        layout = layout_suit.floating
    }
}

return screens