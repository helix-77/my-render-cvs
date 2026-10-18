#!/usr/bin/env bash

DESIGN="design.yaml"
LOCALE="locale.yaml"
SETTINGS="settings.yaml"

# Collect available CV files (excluding config files)
cv_files=()
for f in *.yaml; do
  case "$f" in
    design.yaml|locale.yaml|settings.yaml) ;;
    *) cv_files+=("$f") ;;
  esac
done

if [ ${#cv_files[@]} -eq 0 ]; then
  echo "No CV files found in the directory!"
  exit 1
fi

CV_FILE="$1"

# If no file passed as argument, let the user choose from an interactive list
if [ -z "$CV_FILE" ]; then
  # If input is not a terminal (e.g. non-interactive), default to first CV
  if [ ! -t 0 ]; then
    CV_FILE="${cv_files[0]}"
  else
    echo "Select a CV to live-edit:"
    select f in "${cv_files[@]}" "Quit"; do
      if [ "$f" = "Quit" ]; then
        exit 0
      elif [ -n "$f" ]; then
        CV_FILE="$f"
        break
      else
        echo "Invalid selection. Please choose a number from the list."
      fi
    done
  fi
fi

if [ ! -f "$CV_FILE" ]; then
  echo "Error: File '$CV_FILE' does not exist."
  exit 1
fi

cv_name="${CV_FILE%.yaml}"
out_dir="rendercv_output/$cv_name"

echo "=================================================="
echo " Starting live editing for: $CV_FILE"
echo " Output folder: $out_dir/"
echo " Watching for changes in $CV_FILE, $DESIGN, $LOCALE, $SETTINGS..."
echo " Press Ctrl+C in terminal to stop."
echo "=================================================="

# Trap Ctrl+C (INT) and TERM to clean up temporary .typ files
cleanup() {
  trap - INT TERM EXIT
  rm -f "$out_dir"/*.typ "$out_dir"/*.md "$out_dir"/*.html 2>/dev/null
  echo -e "\n✓ Live editing stopped."
  exit 0
}
trap cleanup INT TERM

rendercv render "$CV_FILE" \
  -d "$DESIGN" \
  -lc "$LOCALE" \
  -s "$SETTINGS" \
  -o "$out_dir" \
  --dont-generate-markdown \
  --watch
