#!/bin/bash

source "$CONFIG_DIR/scripts/colors.sh"

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

case "${CPU_PERCENT}" in
9[0-9] | 100)
  COLOR=$RED
  ;;
[6-8][0-9])
  COLOR=$ORANGE
  ;;
[3-5][0-9])
  COLOR=$YELLOW
  ;;
[1-2][0-9])
  COLOR=$GREEN
  ;;
*)
  COLOR=$RED
  ;;
esac

sketchybar --set $NAME \
  label="$CPU_PERCENT%" \
  icon="" \
  icon.color=$COLOR \
  label.color=$COLOR
