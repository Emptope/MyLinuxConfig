# ~/.config/zathura/switch-theme.sh

#!/bin/bash

# Directory where Zathura theme files are stored
THEME_DIR="$HOME/.config/zathura/themes"
# The main Zathura configuration file
TARGET="$HOME/.config/zathura/zathurarc"
# The name of the theme to apply (passed as the first argument)
THEME="$1"

# --- Input Validation ---
# Check if a theme name was provided
if [ -z "$THEME" ]; then
  echo "Usage: $0 [theme_name]"
  echo "Specify the name of a theme file (without extension) located in $THEME_DIR."
  # Show available themes if possible
  if [ -d "$THEME_DIR" ]; then
      echo "Available themes:"
      ls -1 "$THEME_DIR" | sed 's/\.[^.]*$//' # List files without extension
  fi
  exit 1
fi

# Construct the full path to the theme file
THEME_FILE="$THEME_DIR/$THEME"

# Check if the theme file actually exists
if [ ! -f "$THEME_FILE" ]; then
  echo "Error: Theme file '$THEME_FILE' not found."
   if [ -d "$THEME_DIR" ]; then
      echo "Available themes:"
      ls -1 "$THEME_DIR" | sed 's/\.[^.]*$//'
  fi
  exit 1
fi

# --- Backup ---
# Create a backup of the current configuration file
cp "$TARGET" "$TARGET.bak"
echo "Backed up current configuration to $TARGET.bak"

# --- Remove Old Theme Settings (Preserving Highlights) ---
echo "Removing existing recolor settings from $TARGET..."
# Use more specific patterns matching the start of the line (^)
# This ensures we only remove the exact settings related to recoloring,
# leaving highlight settings untouched.
sed -i '/^set recolor-lightcolor/d' "$TARGET"
sed -i '/^set recolor-darkcolor/d' "$TARGET"
sed -i '/^set recolor-keephue/d' "$TARGET"
# Remove both 'set recolor true' and 'set recolor false' to ensure a clean state
sed -i '/^set recolor true/d' "$TARGET"
sed -i '/^set recolor false/d' "$TARGET"

# --- Apply New Theme Settings ---
echo "Applying settings from '$THEME_FILE'..."
# Append the contents of the selected theme file to the main config
# IMPORTANT: Ensure your theme files ONLY contain the relevant 'recolor...' settings.
# Example theme file content:
# set recolor-lightcolor "#ffffff"
# set recolor-darkcolor "#000000"
# set recolor-keephue false
# set recolor true
cat "$THEME_FILE" >> "$TARGET"

# --- Confirmation ---
echo "Successfully switched Zathura theme to '$THEME'."
echo "Please restart Zathura for the changes to take effect."

exit 0
