#!/usr/bin/env bash
export BEMENU_OPTS='-H 28 -p "Logout:" --fn "JetBrainsMono Nerd Font 10" --fb "#1e1e2e" --ff "#cdd6f4" --nb "#1e1e2e" --nf "#cdd6f4" --tb "#1e1e2e" --hb "#1e1e2e" --tf "#f38ba8" --hf "#f9e2af" --af "#cdd6f4" --ab "#1e1e2e"'
if pgrep -x "bemenu" > /dev/null 2>&1; then
  pkill -x "bemenu"
else
  case "$(echo -e 'poweroff\nreboot\nlogout' | bemenu '$@')" in
    "poweroff")
      systemctl poweroff
      ;;
    "reboot")
      systemctl reboot
      ;;
    "logout")
      mmsg dispatch quit
      ;;
    *)
      exit 0
      ;;
  esac
fi
