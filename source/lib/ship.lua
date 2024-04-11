import "CoreLibs/sprites"
import "CoreLibs/timer"
import "laser"

local pd = playdate
local gfx = playdate.graphics

class("Ship").extends(gfx.sprite)

local image = gfx.image.new("assets/ship")

function Ship:init()
	Ship.super.init(self)

	self.speed = 5

	self:setCollideRect(0, 0, 22, 30)
	self:setGroups(1)

	self:setImage(image)

	self:moveTo(30, 120)
	self:add()

	timer = pd.timer.new(300, function() self:shootLaser() end)
	timer.repeats = true
end

function Ship:update()
	if playdate.buttonIsPressed(playdate.kButtonDown) then
		self:moveWithCollisions(self.x, self.y + self.speed)
	  end

	  if playdate.buttonIsPressed(playdate.kButtonUp) then
		self:moveWithCollisions(self.x, self.y - self.speed)
	  end
end

function Ship:shootLaser()
	x = new Laser(self.y)
end