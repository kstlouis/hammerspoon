## Hammerspoon

There will come a day when my init file doesn't hold everything, and the functions are organized a little bit better.

Today is not that day.



## Functions:

#### **Kirby Shrug**
Takes the shrug and puts it in your clipboard for easy pasting into your fantastically passive-aggressive tweet.

Really not sure why that's the name of this function. Stole it wholesale from [Andy Williams](https://github.com/nonissue), because it is amazing.

#### **WifiWatcher**
Checks your current wifi's SSID and changes volume settings accordingly. Mutes the system volume if away from home SSID, and unmutes when you return.

No more pesky alerts when you first open your laptop in class or in a meeting.

#### **Hammerspoon Config Watcher**
Looks for a change in init.lua file, and reloads the config in Hammerspoon. No more reloading manually.

#### **Keystroke Simulator**
Some website are really dumb and don't allow pasting into input fields, really tough if you use a password manager. This will simulate keyboard type events and allow you to paste whatever is in your clipboard as normal

#### **Window management tools**
This section (mostly) comes from a bunch of [SizeUp](http://www.irradiatedsoftware.com/sizeup/) emulation code that I found [here](https://gist.github.com/josephholsten/1e17c7418d9d8ec0e783). Only kept the actions to move the active window from one monitor to the next. Also modified them to optionally make the active window fullscreen after moving the new monitor with an alternate key binding.

I prefer using this to vanilla hs.grid.pushWindowNextScreen as this will also preserve the window's dimensions relative to the display.
