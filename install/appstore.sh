#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps from App Store"
echo "version 1.1 by Maxim Gladkih"

apps=(
    928871589   #Noizio
    568494494   #Pocket
    907364780   #Tomato One
    412448059   #ForkLift
    585829637   #Todoist
    448943039   #BookReader
    1522368690  #WebP Converter
    1545870783  #Color Picker
    1451685025  #WireGuard
)

mas install "${apps[@]}"