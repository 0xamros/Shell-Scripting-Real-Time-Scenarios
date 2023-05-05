#!/bin/bash

function killzombies {
  # Find all zombie processes and store their PIDs in an array
  zombies=($(ps aux | awk '{if ($8 == "Z") print $2}'))

  # If there are no zombie processes, exit the function
  if [ ${#zombies[@]} -eq 0 ]; then
    echo "No zombie processes found"
    return
  fi

  # Kill all zombie processes
  for pid in "${zombies[@]}"; do
    echo "Killing zombie process $pid"
    kill -9 "$pid"
  done

  echo "All zombie processes killed"
}
