#!/bin/bash

use_template=false
template_folder="template"

while [[ $# -gt 0 ]]; do
  case $1 in
    --template)
      use_template=true
      shift
      ;;
    --with-no-html-folder)
      exclude_html=true
      shift
      ;;
    *)
      echo "Usage: $0 [--template] [--with-no-html-folder]"
      exit 1
      ;;
  esac
done

if $use_template && [ ! -d "$template_folder" ]; then
  echo "Error: Template folder '$template_folder' does not exist."
  exit 1
fi

last_number=0

for folder in class-*; do
  if [[ -d "$folder" && "$folder" =~ ^class-([0-9]+)$ ]]; then
    number=${BASH_REMATCH[1]}
    if (( number > last_number )); then
      last_number=$number
    fi
  fi
done

next_number=$(printf "%02d" $((last_number + 1)))
new_folder="class-$next_number"

if $use_template; then
  cp -r "$template_folder" "$new_folder"
  echo "Created folder: $new_folder (copied from $template_folder)"
elif $exclude_html; then
  rsync -av --exclude="html" "$template_folder/" "$new_folder"
  echo "Created folder: $new_folder (copied from $template_folder without html folder)"
else
  mkdir "$new_folder"
  echo "Created empty folder: $new_folder"
fi
