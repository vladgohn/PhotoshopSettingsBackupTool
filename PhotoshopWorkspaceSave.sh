#!/bin/bash

# ANSI escape codes for colors
BLUE="\033[0;34m"
ORANGE="\033[0;33m"
PINK="\033[1;35m"
RESET="\033[0m"

# Ask user for destination path
echo -e "${PINK}📂 Enter destination path:${RESET}"
read DESTINATION_PATH

PS3="Select an option: "

# Detect installed Photoshop versions
PHOTOSHOP_VERSIONS=$(ls /Applications/ | grep "Adobe Photoshop" | sort -u)
echo -e "${PINK}Select an option from installed versions:${RESET}"

# Display versions for user to choose
select VERSION in "${PHOTOSHOP_VERSIONS[@]}"; do
    if [ -n "$VERSION" ]; then
        SELECTED_VERSION=$(echo $VERSION | grep -Eo '[0-9]{4}')
        break
    else
        echo "Invalid selection."
    fi
done

SETTINGS_PATH="/Users/vladgohn/Library/Preferences/$VERSION Settings"
WORKSPACES_PATH="$SETTINGS_PATH/WorkSpaces"
COLOR_SETTINGS_PATH="/Applications/$VERSION/$VERSION.app/Contents/Required/UIColors.txt"

# Ask user which workspace to copy
echo -e "${PINK}Select an option for workspace to copy (default is xd0):${RESET}"
WORKSPACES=$(ls "$WORKSPACES_PATH")
select WORKSPACE in $WORKSPACES; do
    if [ -z "$WORKSPACE" ]; then
        WORKSPACE="xd0.psw"
    fi
    break
done

# Copy workspace file
if cp "$WORKSPACES_PATH/$WORKSPACE" "$DESTINATION_PATH"; then
    echo -e "${ORANGE}🟢 $WORKSPACE${RESET}"
    osascript -e "tell application \"Finder\" to set label index of file POSIX file \"$DESTINATION_PATH/$WORKSPACE\" to 2" > /dev/null
fi

# Copy main Photoshop settings
declare -a settings_files=("Adobe Photoshop $SELECTED_VERSION Prefs.psp" "Brushes.psp" "CustomShapes.psp" "Gradients.psp" "Patterns.psp" "Styles.psp" "Swatches.psp" "UIPrefs.psp")

for file in "${settings_files[@]}"; do
    if cp "$SETTINGS_PATH/$file" "$DESTINATION_PATH"; then
        echo -e "${ORANGE}🟢 $file${RESET}"
        osascript -e "tell application \"Finder\" to set label index of file POSIX file \"$DESTINATION_PATH/$file\" to 2" > /dev/null
    fi
done

# Copy color settings file
if cp "$COLOR_SETTINGS_PATH" "$DESTINATION_PATH"; then
    echo -e "${ORANGE}🟢 UIColors.txt${RESET}"
    osascript -e "tell application \"Finder\" to set label index of file POSIX file \"$DESTINATION_PATH/UIColors.txt\" to 2" > /dev/null
fi

# Final message
if [ $? -eq 0 ]; then
    echo -e "${BLUE}🦄 All tasks completed successfully.${RESET}"
else
    echo -e "${BLUE}😱 There were some errors.${RESET}"
fi
