

local supermash = {"cmd", "alt", "ctrl"}
local minimash = {"ctrl", "alt"}
local shiftmash = {"ctrl", "alt", "shift"}


-- removes animations, makes window movements happen supa fast
hs.window.animationDuration = 0

-- iTunes controls; change songs easily even when running in background
hs.hotkey.bind(supermash, 'right', hs.itunes.next)
hs.hotkey.bind(supermash, 'left', hs.itunes.previous)


-- "Shrug"
function kirby()
	test = hs.alert.show(" ¯\\_(ツ)_/¯ ", 1.5)
	hs.pasteboard.setContents("¯\\_(ツ)_/¯")
end

hs.hotkey.bind(supermash, 'K', kirby)


-- Mutes volume when not on home WiFi network
wifiWatcher = nil
homeSSID = "weefee"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setMuted(false)
        hs.notify.new({title="Hammerspoon", informativeText="Mute Disabled"}):send()
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setMuted(true)
        hs.notify.new({title="Hammerspoon", informativeText="Volume Mute Enabled"}):send()
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()



-- Reload Hammerspoon config, automatically when init.lua is saved. Show system notification.
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.notify.new({title="Hammerspoon", informativeText="Config Loaded"}):send()

-- Defeat paste blocking by emitting fake keyboard events
hs.hotkey.bind(minimash, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)


-- === sizeup ===
-- SizeUp emulation for hammerspoon
-- stolen from https://gist.github.com/josephholsten/1e17c7418d9d8ec0e783
-- removed the bits I didn't want to use.

-- known issue: moving window to new monitor does not adjust menu bar. Active menu bar for that window
-- is still the menu bar from the previous monitor, until the window is interacted with ie made fullscreen

-- Future improvements: better handling of fullscreen and not. 
-- ie if app is already fullscreen, move to fullscreen on next monitor and keep in fullscreen.

local sizeup = { }
--------------
-- Bindings --
--------------

--- Multiple Monitor Actions ---
-- Send Window Prev Monitor
hs.hotkey.bind(minimash, "Left", function()
  sizeup.send_window_prev_monitor()
end)
--Send Window Prev Monitor, then make fullscreen --still beta? not super confident yet
hs.hotkey.bind(shiftmash, "Left", function()
  sizeup.send_window_prev_monitor()
  local win = hs.window.focusedWindow()
  win:setFullScreen(not win:isFullScreen())
end)
-- Send Window Next Monitor
hs.hotkey.bind(minimash, "Right", function()
  sizeup.send_window_next_monitor()
end)
--Send Window Next Monitor, then make fullscreen --still beta? not super confident yet
hs.hotkey.bind(shiftmash, "Right", function()
  sizeup.send_window_next_monitor()
  local win = hs.window.focusedWindow()
  win:setFullScreen(not win:isFullScreen())
end)



function sizeup.send_window_prev_monitor()
  hs.alert.show("Prev Monitor")
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():previous()
  win:moveToScreen(nextScreen)
end

function sizeup.send_window_next_monitor()
  hs.alert.show("Next Monitor")
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  win:moveToScreen(nextScreen)
end

--- move window to the the given screen, keeping the relative proportion and position window to the original screen.
function hs.window:moveToScreen(nextScreen)
  local currentFrame = self:frame()
  local screenFrame = self:screen():frame()
  local nextScreenFrame = nextScreen:frame()
  self:setFrame({
    x = ((((currentFrame.x - screenFrame.x) / screenFrame.w) * nextScreenFrame.w) + nextScreenFrame.x),
    y = ((((currentFrame.y - screenFrame.y) / screenFrame.h) * nextScreenFrame.h) + nextScreenFrame.y),
    h = ((currentFrame.h / screenFrame.h) * nextScreenFrame.h),
    w = ((currentFrame.w / screenFrame.w) * nextScreenFrame.w)
  })
end


-------------------------------------------------------------------------------------------

-- Future ideas for Hammerspoon

-- "shrug screenshot" tool - activate Kirby srhug and immediately take a screenshot of what's behind it.
-- sizeup enhancements, as previously listed; for better multi-monitor window management.
