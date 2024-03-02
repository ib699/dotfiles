compton &

while true; do
	if [[ "$(acpi | cut -d " " -f 3)" = "Charging," ]]; then
            xsetroot -name "CP $(cat /sys/class/power_supply/BAT0/capacity)% | $( date +"%F %R  " )"
	else xsetroot -name " P $(cat /sys/class/power_supply/BAT0/capacity)% | $( date +"%F %R  " )"
        fi
        sleep 1m	
done &

feh --bg-fill /home/lwall/Documents/background/clouds.jpg
