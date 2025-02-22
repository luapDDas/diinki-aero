# Diinki Aero

This is my frutiger aero themed rice, I will likely update it with time; so you can head over to the releases page for more concrete versions.
I made a video of this rice, which you can watch here:
https://www.youtube.com/watch?v=Tx9dHc0MyHs

![alt text](./wallpapers/aquarium.png)

# Installation

You need to install the following dependencies on your system:

- `eww` for widgets
- `hyprland` the tiling window manager
- `caja` the file explorer
- `waybar` the taskbar
- `wofi` the application launcher.
- I use the `kitty` terminal, but you can use whichever terminal emulator that you are comfortable with.

To install, copy all the folders in the `config` directory, to the `~/.config` directory on your system; make sure to backup your previous
configs if you have them.

## Weather Widget

The weather widget uses `openweathermap.org`, they give you 2000 free api calls / day. Create an account there, get an API key, and then edit
the `eww/scripts/weather.sh` file with the following details. I've commented more specific instructions in that bash file.

The bash file stores the weather data in `~/.cache/eww/weather` every time `weather.sh --getdata` is called; as such, I recommend creating a
cronjob for calling `~/.config/eww/scripts/weather.sh --getdata` every 30 minutes.

> I will likely change the way the weather widget works in the future.

I will likely also add a lot more widgets in the future, you can enable/disable specific ones in the
`eww/scripts/start.sh` by just commenting/uncommenting specific ones.

## GTK theme & Icon Pack

To install the icon theme, copy the `crystal-remix-icon-theme-diinki-version` directory in `IconTRheme` to your `~/.local/share/icons` or `/usr/share/icons` directories
and then set the theme to the one in use either with `gsettings` or the `dconf` applications; which you can download with most linux package managers.

To install the GTK theme, copy the `diinki-aero` folder in `GTKTheme` to your `~/.themes` directory,
and then set the GTK theme to "diinki-aero" with either `gsettings` or the `dconf` application.

# The Default Hyprland Keybinds

Obviously, you can and should change the keybinds for whichever you prefer, but the important ones to note that I have are:
`MOD + Enter` = opens terminal (by default, kitty, you need to have it installed or edit the config file).
`MOD` is the super key/windows key.

`MOD + F` = Toggle maximize of a window
`MOD + D` = Open the Wofi application launcher
`MOD + E` = open the file explorer (you need caja, or edit the config file)
`SHIFT + MOD + SPACE` = Toggle a window from tiling to floating.
`MOD + mouse1 drag` = Move a window
`MOD + mouse2 drag` = Resize a window
`MOD + Q` = Exit/Close an application

`MOD + SHIFT + (any number-row number)` = Move the window to a workspace with that ID.

# Updates & Changes

Aspects and components of this rice will change with time, until I have a finalized design, I'll make specific releases on the github releases page.
