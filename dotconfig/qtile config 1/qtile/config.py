import os, subprocess
from libqtile import hook

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])

from core import (  # noqa: F401
    floating_layout,
    groups,
    hooks,
    keys,
    layouts,
    mouse,
    screens,
    widget_defaults,
)

auto_fullscreen = True
auto_minimize = False
bring_front_click = False
cursor_warp = False
follow_mouse_focus = True
focus_on_window_activation = "smart"
reconfigure_screens = True
wmname = "qtile"
