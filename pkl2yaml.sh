#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file.pkl>"
  exit 1
fi

INPUT="$1"

# Ensure the file exists
if [ ! -f "$INPUT" ]; then
  echo "Error: file '$INPUT' not found"
  exit 1
fi

# Strip the .pkl extension and build the output name
BASENAME="${INPUT%.pkl}"
OUTPUT="${BASENAME}.yaml"

# Run pkl to convert to YAML
# Adjust 'pkl eval' syntax if your CLI differs
pkl eval "$INPUT" --format yaml > "$OUTPUT"

echo "Converted '$INPUT' -> '$OUTPUT'"
