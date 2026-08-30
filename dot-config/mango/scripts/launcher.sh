#!/usr/bin/env bash
if pgrep -x "bemenu-run" > /dev/null 2>&1; then
  pkill -x "bemenu-run"
else
  exec bemenu-run -H 28 -p "Run:" --fn "JetBrainsMono Nerd Font 10" --fb "#1e1e2e" --ff "#cdd6f4" --nb "#1e1e2e" --nf "#cdd6f4" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#f38ba8" --hf "#f9e2af" --af "#cdd6f4" --ab "#1e1e2e" "$@"
fi
