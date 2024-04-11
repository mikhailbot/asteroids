import "CoreLibs/graphics"
import "CoreLibs/timer"
import "lib/Asteroid"
import "lib/Ship"

local pd = playdate
local gfx = pd.graphics

ship = new Ship()

local asteroids = {}

for i = 1, 3 do
	table.insert(asteroids, Asteroid(20))
end

local spawnInterval = 2

pd.resetElapsedTime()

function pd.update()
	pd.timer.updateTimers()
	gfx.sprite.update()
	
	-- Check if it's time to spawn a new asteroid
	if pd.getElapsedTime() >= spawnInterval then
		-- Reset the timer
		pd.resetElapsedTime()

		-- Create new asteroids and add them to the list
		for i = 1, math.random(1, 4) do
			table.insert(asteroids, Asteroid(20))
		end
		
		-- Occasionally also spawn a big one
		if math.random(1,4) == 1 then
			table.insert(asteroids, Asteroid(60))
		end
	end
end
