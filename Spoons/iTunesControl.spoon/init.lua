-- Attempt at creating a new spoon from exisiting functions
-- to clean up my main init a bit

-- Do you have a touchbar? If you hate how difficult it can be to change songs if you're not in iTunes,
-- You might find this handy.

-- spoon to give you keyboard commands to skip forward/back in iTunes no matter where you are. 


local obj = {}
obj.__index = obj

-- Metadata
obj.name = "iTunesControl"
obj.version = "0.0.1"
obj.author = "Kellan St.Louis <kstlouis@me.com>"
obj.homepage = "https://github.com/kstlouis"
obj.license = "MIT = https://opensource.org/licenses/MIT"
-- end Metadata

-- init logger
obj.logger = hs.logger.new('iTunesControl')

function obj:nextTrack()
	return hs.itunes.next
end

function obj:prevTrack()
	return hs.itunes.previous
end

function obj:playPause()
	return hs.itunes.playpause
end

return obj