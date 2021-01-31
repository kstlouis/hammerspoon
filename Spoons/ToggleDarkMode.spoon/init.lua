
local obj = {}
obj.__index = obj

obj.onScript = [[
    tell application "System Events"
	    tell appearance preferences
		    set dark mode to not dark mode
	    end tell
    end tell
]]

--- DarkMode:toggle()
function obj:switch()
	return hs.osascript.applescript(obj.onScript)
end

return obj