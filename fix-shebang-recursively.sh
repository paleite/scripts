#!/usr/bin/env bash

# Replace the first line of every shell script in the current directory
find . -type f -name "*.sh" -not -path "./node_modules/*" -not -path "./.git/*" | while read -r file; do
  # Save the current first line of the file
  first_line=$(head -n 1 "$file")

  # Check if the first line is a shebang line
  if [[ $first_line != "#!/bin/bash"* ]]; then
    continue
  fi

  echo "Fixing $file"

  # Replace the first line with the new shebang line
  sed -i.bak -e "1s/.*/#!\/usr\/bin\/env bash/" "$file"
done
