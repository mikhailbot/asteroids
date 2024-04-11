import "CoreLibs/sprites"

local pd = playdate
local gfx = playdate.graphics

class("Asteroid").extends(gfx.sprite)

local image = gfx.image.new("assets/rock")

function Asteroid:init(size)
	Asteroid.super.init(self)
	
	self.health = size / 10
	self.xSpeed = math.random() * 20 / size + 0.5
	self.ySpeed = math.random() * 0.3 - 0.15
	
	self:setCollideRect(0, 0, size, size)
	self:setGroups(2)
	self:setTag(2)
	
	self:setScale(size / 20)
	self:setImage(image)
	self:moveTo(pd.display.getWidth(), math.random(20, pd.display.getHeight() - 20))
	self:add()
end

function Asteroid:update()
	if self.health == 0 then	
		self:remove()
	end
	
	local actualX, actualY, collisions, length = self:moveWithCollisions(self.x - self.xSpeed, self.y + self.ySpeed)
	
	if self.x == 0 then
		self:remove()
	end
	
	if self.y == 0 | 240 then
		self:remove()
	end
end

function Asteroid:collisionResponse()
	return playdate.graphics.sprite.kCollisionTypeOverlap
end