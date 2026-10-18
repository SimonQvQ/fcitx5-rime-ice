#!/usr/bin/env bash
# Remove the Rime Ice theme and switch fcitx5 back to the default dark theme.
set -euo pipefail

THEME_NAME="rimeice"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
CONF_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
DEST_DIR="${DATA_HOME}/fcitx5/themes/${THEME_NAME}"
CONF_FILE="${CONF_HOME}/fcitx5/conf/classicui.conf"

rm -rf "$DEST_DIR"
echo "removed: $DEST_DIR"

if [ -f "$CONF_FILE" ]; then
  backup="${CONF_FILE}.bak.$(date +%Y%m%d%H%M%S)"
  cp "$CONF_FILE" "$backup"
  echo "backup: $backup"

  set_opt() {
    local key="$1" value="$2"
    if grep -qE "^[[:space:]]*#?[[:space:]]*${key}=" "$CONF_FILE"; then
      sed -i -E "s|^[[:space:]]*#?[[:space:]]*${key}=.*|${key}=${value}|" "$CONF_FILE"
    fi
  }
  set_opt "Theme" "default-dark"
  set_opt "DarkTheme" "default-dark"
  echo "switched Theme back to default-dark in: $CONF_FILE"
fi

echo
echo "Restart fcitx5 to apply:  fcitx5 -r -d"
