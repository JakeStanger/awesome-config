#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run feh --bg-fill /home/jake/Wallpaper.jpg
run picom -b -d :0 -CG
run discord
run caprine
run firefox
run mailspring
run steam

run kitty --session /home/jake/.config/kitty/ncmpcpp.session
run kitty
