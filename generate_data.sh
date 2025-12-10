#!/usr/bin/env bash

DIR="./assets/images"
OUTPUT="./data/images.json"

files=()
while IFS= read -r -d '' file; do
  files+=("\"$(basename "$file")\"")
done < <(find "$DIR" -maxdepth 1 -type f -print0)

printf "[%s]\n" "$(printf "%s, " "${files[@]}" | sed 's/, $//')" >"$OUTPUT"
