#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <LEVEL> <path-to-log-file>" >&2
  exit 2
fi

level="$1"
file="$2"

if [ ! -r "$file" ]; then
  echo "Error: cannot read file '$file'" >&2
  exit 2
fi

awk -v lvl="$level" '
  /^[[:space:]]*$/ { next }
  NF < 3 { next }
  {
	svc = $2
	lv  = $3
	if (lv == lvl) counts[svc]++
  }
  END {
	for (s in counts) print counts[s], s
  }
' "$file" | sort -k1,1nr -k2,2 | awk '{ print $2": "$1 }'