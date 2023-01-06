#!/usr/bin/env bash

# Replaces `#!/bin/bash` with `#!/usr/bin/env bash` in every shell script
# recursively, starting from the current directory.

[[ "${DEBUG}" == 'true' ]] && set -o xtrace
set -o errexit
set -o pipefail
set -o nounset

# Recursively iterate over shell-files starting from the current directory
find . -type f -name "*.sh" -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/coverage/*" -not -path "*/dist/*" | while read -r file; do
  shebang=$(head -n 1 "$file")

  # Skip files that don't start with `#!/bin/bash`
  if [[ $shebang != "#!/bin/bash"* ]]; then
    continue
  fi

  echo "Fixing $file"

  # Replace the first line with `#!/usr/bin/env bash`
  sed -i.bak -e "1s/.*/#!\/usr\/bin\/env bash/" "$file"
done
