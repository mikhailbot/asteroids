import "CoreLibs/sprites"

local pd = playdate
local gfx = playdate.graphics

class("Laser").extends(gfx.sprite)

function Laser:init(yPosition)
	Laser.super.init(self)

	self.xSpeed = 10

	self:setCollideRect(0, 0, 8, 2)
	self:setGroups(3)
	self:setTag(3)
	self:setCollidesWithGroups(2)

	local laserImage = gfx.image.new(8, 2)
	gfx.pushContext(laserImage)
		gfx.fillRect(0, 0, 8, 2)
	gfx.popContext(laserImage)
	self:setImage(laserImage)

	self:moveTo(50, yPosition)
	self:add()
end

function Laser:update()
	local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.xSpeed, self.y)

	for i = 1, #collisions do
		if collisions[i].other:getTag() == 2 then
			self:remove()
			collisions[i].other.health -= 1
		end
	end

	if self.x == 400 then
		self:remove()
	end
end