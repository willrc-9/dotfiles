
#######################
### Open on startup ###
#######################

workspace="10:Dashboard"
swaymsg "workspace $workspace"


kitty --title "fastfetch" -e  &
kitty --title "htop" -e htop &
kitty --title "cmatrix" -e cmatrix &
kitty --title "cava" -e cava &
while [ "$(swaymsg -t get_tree |jq '[.. | select(.type=="con" and .workspace=="10:Dashboard")] | length')" -lt 4 ]; do
	sleep 0.2
done

swaymsg "[title=\"fastfetch\"] move position center"
swaymsg "[title=\"htop\"] move right"
swaymsg "[title=\"cmatrix\"] move down"
swaymsg "[title=\"cava\"] move down"

swaymsg "workspace 10: Dashboard; layout splith"
swaymsg "focus parent; layout splitv"


waybar&
mako&
pipewire&
nm-applet&
blueman-applet&
