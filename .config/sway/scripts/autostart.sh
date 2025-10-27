#!/usr/bin/env bash
set -euo pipefail

# ------------------------------
# SETTINGS — edit these freely
# ------------------------------
WAIT_HOSTS="${WAIT_HOSTS:-1.1.1.1 8.8.8.8 archlinux.org}"
WAIT_MAX="${WAIT_MAX:-60}"          # seconds to wait before giving up
WAIT_INTERVAL="${WAIT_INTERVAL:-2}" # seconds between ping attempts

# Local (no-network) apps — start immediately
LOCAL_APPS=(
#  "thunar"
)

# Network-dependent apps — start only after ping success
NET_APPS=(
# "ticktick"
  "zen-browser"
  "firefox"
)
# ------------------------------

LOG="$HOME/.cache/sway-autostart.log"
mkdir -p "$(dirname "$LOG")"
echo -e "\n==== $(date '+%F %T') autostart begin ====" >> "$LOG"

run_bg() {
  local cmd="$1"
  local bin="$(awk '{print $1}' <<<"$cmd")"
  if command -v "$bin" >/dev/null 2>&1; then
    ( bash -lc "$cmd" & ) >>"$LOG" 2>&1 || true
    echo "[start] $cmd" >> "$LOG"
  else
    echo "[skip] $cmd (not found)" >> "$LOG"
  fi
}

wait_for_network() {
  echo "[netwait] hosts: $WAIT_HOSTS; timeout=${WAIT_MAX}s; interval=${WAIT_INTERVAL}s" >> "$LOG"
  local elapsed=0
  while (( elapsed < WAIT_MAX )); do
    for h in $WAIT_HOSTS; do
      if ping -c1 -W1 "$h" &>/dev/null; then
        echo "[netwait] network up via $h at ${elapsed}s" >> "$LOG"
        return 0
      fi
    done
    sleep "$WAIT_INTERVAL"
    (( elapsed += WAIT_INTERVAL ))
  done
  echo "[netwait] timeout after ${WAIT_MAX}s; continuing anyway" >> "$LOG"
  return 1
}

export XDG_CURRENT_DESKTOP="${XDG_CURRENT_DESKTOP:-sway}"
export XDG_SESSION_TYPE="${XDG_SESSION_TYPE:-wayland}"

# 1️⃣ Start local apps immediately
for cmd in "${LOCAL_APPS[@]}"; do
  run_bg "$cmd"
done

# 2️⃣ Wait for network
wait_for_network

# 3️⃣ Start network-dependent apps
for cmd in "${NET_APPS[@]}"; do
  run_bg "$cmd"
done

echo "==== $(date '+%F %T') autostart done ====" >> "$LOG"
disown -a
exit 0

