#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run discord
run caprine
run firefox
run mailspring
run steam