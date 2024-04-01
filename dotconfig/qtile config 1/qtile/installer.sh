#!/bin/bash

if [ -f /etc/arch-release ]; then
    echo "Arch Linux"
    # install qtile deps in arch
    sudo pacman -S brightnessctl otf-hasklig-nerd pacman-contrib pamixer playerctl python-dbus-next python-psutil ttf-nerd-fonts-symbols-mono
    yay -S qtile-extras-git qtile-git
elif [ -f /etc/debian_version ]; then
    echo "Debian"
    sudo apt install python3 python3-pip python3-venv python3-v-sim python-dbus-dev libpangocairo-1.0-0 python3-xcffib python3-cairocffi vifm ueberzug qutebrowser xwallpaper fzf sxiv rofi wget kitty lightdm vim git bash bash-completion pulseaudio alsa-utils thunar slock picom -yy
    xdg-user-dirs-update
    mkdir ~/.local
    mkdir ~/.local/src
    cd ~/.local/src
    python3 -m venv qtile_venv
    cd qtile_venv/
    git clone https://github.com/qtile/qtile.git
    bin/pip install qtile/.
    sudo ln -s /home/lwall/.local/src/qtile_venv/bin/qtile /usr/bin/qtile
    echo "[Desktop Entry]
    Version=1.0
    Name=qtile
    Exec=qtile start
    Icon=
    Type=Application" > /usr/share/xsessions/qtile.desktop
    wget https://github.com/Alex313031/thorium/releases/download/M121.0.6167.204/thorium-browser_121.0.6167.204_AVX.deb
    sudo apt install ./thorium-browser_121.0.6167.204_AVX.deb
    echo 'Section "InputClass"
            Identifier "libinput touchpad catchall"
	    MatchIsTouchpad "on"
	    MatchDevicePath "/dev/input/event*"
	    Driver "libinput"
	    Option "Tapping" "on"
    EndSection' > /etc/X11/xorg.conf.d/50-synaptics.conf
else
    echo "Other Linux Distribution"
fi

