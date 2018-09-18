


-- to quickly disconnect the egpu, and any external drives connected to the mac. 

-- runs some simple AppleScript inline to first eject all drives. 
-- seen the odd error when ejecting drives, nned to investigate a bit more but it
-- doesn't happen very often.

-- 

ejectScript = [[
tell application "Finder"
  eject (every disk whose ejectable is true)
end tell

do shell script "/usr/bin/SafeEjectGPU Eject"
]]

function ejectmemaybe(eventType)
  hs.alert.show("Trying to Eject...", 1.5)
  hs.osascript.applescript(ejectScript)
end
hs.hotkey.bind(supermash, 'E', ejectmemaybe)