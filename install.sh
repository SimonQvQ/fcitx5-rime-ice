#!/usr/bin/env bash
# Install the Rime Ice theme for fcitx5.
set -euo pipefail

THEME_NAME="rimeice"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/${THEME_NAME}"

DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
CONF_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DEST_DIR="${DATA_HOME}/fcitx5/themes/${THEME_NAME}"
CONF_FILE="${CONF_HOME}/fcitx5/conf/classicui.conf"

if ! command -v fcitx5 >/dev/null 2>&1; then
  echo "error: fcitx5 not found in PATH" >&2
  exit 1
fi

if [ ! -d "$SRC_DIR" ]; then
  echo "error: theme directory not found: $SRC_DIR" >&2
  exit 1
fi

mkdir -p "$DEST_DIR" "$(dirname "$CONF_FILE")"
cp -r "$SRC_DIR/." "$DEST_DIR/"

if [ -f "$CONF_FILE" ]; then
  backup="${CONF_FILE}.bak.$(date +%Y%m%d%H%M%S)"
  cp "$CONF_FILE" "$backup"
  echo "backup: $backup"
fi

touch "$CONF_FILE"

# set_opt KEY VALUE: replace the key if present (including commented-out), else append.
set_opt() {
  local key="$1" value="$2"
  if grep -qE "^[[:space:]]*#?[[:space:]]*${key}=" "$CONF_FILE"; then
    # Escape characters that would break sed's replacement.
    local esc
    esc=$(printf '%s' "$value" | sed -e 's/[&/\\]/\\&/g')
    sed -i -E "s|^[[:space:]]*#?[[:space:]]*${key}=.*|${key}=${esc}|" "$CONF_FILE"
  else
    printf '%s=%s\n' "$key" "$value" >>"$CONF_FILE"
  fi
}

set_opt "Theme" "rimeice"
set_opt "DarkTheme" "rimeice"
set_opt "UseDarkTheme" "True"
set_opt "UseAccentColor" "False"
set_opt "Vertical Candidate List" "True"
set_opt "Font" '"Noto Sans CJK SC 11"'
set_opt "MenuFont" '"Noto Sans CJK SC 11"'

echo "Installed to: $DEST_DIR"
echo "Config:       $CONF_FILE"
echo
echo "Restart fcitx5 to apply:  fcitx5 -r -d"
