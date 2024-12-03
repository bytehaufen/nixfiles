#!/usr/bin/env bash

# Absolute path to this script
BASE_DIR="$(dirname "$(realpath "$0")")"

# Hook directory
HOOKS_DIR="$BASE_DIR/git-hooks"

# Hooks to install
HOOK_NAMES=(
	"pre-commit"
)

# Hook target directory
TARGET_DIR=".git/hooks"

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
	mkdir -p "$TARGET_DIR"
fi

for HOOK_NAME in "${HOOK_NAMES[@]}"; do
	# Remove symlink if it exists
	if [ -L "$TARGET_DIR/$HOOK_NAME" ]; then
		rm "$TARGET_DIR/$HOOK_NAME"
	fi

	# Create symlink
	ln -s "$HOOKS_DIR/$HOOK_NAME" "$TARGET_DIR/$HOOK_NAME"
done

echo "Hook symlinks created."
