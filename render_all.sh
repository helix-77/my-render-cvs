#!/usr/bin/env bash

# If --watch or -w is supplied, delegate to live editing
if [ "$1" = "--watch" ] || [ "$1" = "-w" ]; then
  exec ./live_edit.sh "$2"
fi

DESIGN="design.yaml"
LOCALE="locale.yaml"
SETTINGS="settings.yaml"

# Find and render any .yaml file that isn't a config file
for file in *.yaml; do
  case "$file" in
    design.yaml|locale.yaml|settings.yaml)
      continue
      ;;
    *)
      # Name subfolder based on the CV file (e.g. rendercv_output/All_in_one_CV/)
      cv_name="${file%.yaml}"
      echo "Rendering $file -> rendercv_output/$cv_name/..."
      rendercv render "$file" \
        -d "$DESIGN" \
        -lc "$LOCALE" \
        -s "$SETTINGS" \
        -o "rendercv_output/$cv_name" \
        --dont-generate-markdown

      # Clean up intermediate .typ file (and any leftover .md / .html)
      rm -f "rendercv_output/$cv_name"/*.typ \
            "rendercv_output/$cv_name"/*.md \
            "rendercv_output/$cv_name"/*.html
      ;;
  esac
done
