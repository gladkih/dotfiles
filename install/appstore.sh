#!/bin/bash
echo "+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+"
echo "Installing apps from App Store"
echo "version 1.0 by Maxim Gladkih"

apps=(
    557168941 #Tweetbot
    409203825 #Numbers
    409201541 #Pages
    540348655 #Monosnap
    928871589 #Noizio
    408774844 #Emcee for iTunes
    568494494 #Pocket
    422304217 #Day One Classic
    907364780 #Tomato One
    412448059 #ForkLift
    585829637 #Todoist
    448943039 #BookReader
    497799835 #Xcode
)

mas install "${apps[@]}"