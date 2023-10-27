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
  git pull
  git_pull_exit_code=$? # git pull 명령의 종료 코드 저장

  if [[ $git_pull_exit_code -ne 0 ]]; then
    echo "Error: Git pull failed with exit code $git_pull_exit_code"
  else
    output=$(git pull)
    echo $output
    if [[ "$output" != *"Already up to date."* ]]; then
      install_command
      build_command
      echo "Build Complete in `date`"
    else
      echo "Already up to date in `date`"
    fi
  fi

  sleep $sleep_time
done
