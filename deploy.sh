#!/bin/bash

install_command() {
  pnpm i
}

build_command() {
  pnpm run build
}

# Units: Seconds
sleep_time=600

while true; do
  output=$(git pull)
   if [[ "$output" != *"Already up to date."* ]]; then
      install_command
      build_command
      echo "Build Complete in `date`"
   else
     echo "Already up to date in `date`"
   fi
  sleep sleep_time
done