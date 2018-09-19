# Hammerspoon

Very much a work in progress. 
Main work right now is moving all functions into individual spoon modules, so the main init is a lot cleaner. 

There will come a day when my init file doesn't hold (almost) everything, and the functions are organized a little bit better. Today is not that day.

# Functions:

### Kirby Shrug
Takes the shrug and puts it in your clipboard for easy pasting into your fantastically passive-aggressive tweet. Really not sure why that's the name of this function. Stole it wholesale from [Andy Williams](https://github.com/nonissue), because it is amazing.

### WifiWatcher
Checks your current wifi's SSID and changes volume settings accordingly. Mutes the system volume if away from home SSID, and unmutes when you return.

No more pesky alerts when you first open your laptop in class or in a meeting!
_Note: works 99% of the time. Not 100%. Every so often, volume won't actually be muted. Need to look into that._

### Hammerspoon Config Watcher
Looks for a change in init.lua file, and reloads the config in Hammerspoon. No manual reloading.

### Keystroke Simulator
Some website are really dumb and don't allow pasting into input fields, really tough if you use a password manager. This will simulate keyboard type events and allow you to paste whatever is in your clipboard as normal.

### Window management tools
This section (mostly) comes from a bunch of [SizeUp](http://www.irradiatedsoftware.com/sizeup/) emulation code that I found [here](https://gist.github.com/josephholsten/1e17c7418d9d8ec0e783). Only kept the actions to move the active window from one monitor to the next. Also modified them to optionally make the active window fullscreen after moving the new monitor with an alternate key binding.

I prefer using this to vanilla hs.grid.pushWindowNextScreen as this will also preserve the window's dimensions relative to the display.

### eGPU Ejecter
This does a few things automatically in sequence:
- ejects all mounted volumes and disconnects the eGPU when laptop is going to sleep, then disables the Thunderbolt kext
- when waking unit from sleep, re-enables the TB kext so that the eGPU and all drives are automatically detected and subsequently remounted
There are also menubar options to eject the eGPU, all drives, or both, and check to see the status of the TB kext.
I may have made some changes, but credit for basically all of the core functionalitly here goes to [Andy Williams](https://github.com/nonissue).



#### Future plans / improvements
- function to re-display "now playing" notification from iTunes (the one that you see when a new song starts playing), to easily see what song you're currently listenining to without serious interruption to workflow
- After launching browser, key command to: close current window > open private-browsing window > make window fullscreen.
- alternate Kirby Shrug that also takes screenshot of whatever is behind it in the active window
- Moving fullscreen app to next/previous monitor currently requires pressing key binding twice (once to take out of fullscreen, another to perform move). Would like to explore possibility of moving to new monitor while preserving fullscreen state.
- explore way to change Safari's scroll behavior when pressing spacebar. Would prefer 1/2-page scroll instead of a full page (hammerspoon maybe not needed, maybe just terminal)
