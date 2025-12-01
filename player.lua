local Object = require("classic")
local Bullet = require("bullet")

local Player = Object:extend()

function Player:new(x, y)
	self.x = x
	self.y = y
	self.speed = 200
	self.inclination = 2
end

function Player:draw()
	sucata.graphic.draw_rect({
		x = self.x,
		y = self.y,
		width = 32,
		height = 32,
		texture = "src://sprites/ship.png",
		origin = 0.5,
		atlas_size = 8,
		atlas_x = math.floor(self.inclination)
	})
end

function Player:fire()
	sucata.scene.spawn(Bullet(self.x, self.y - 16))
end

function Player:update()
	local dt = sucata.time.get_delta()
	local moving = false

	if sucata.input.is_pressed("space", "enter") then
		self:fire()
	end

	if sucata.input.is_held("left", "a") and self.x > 20 then
		self.x = self.x - self.speed * dt
		self.inclination = math.max(0, self.inclination - (20 * dt))
		moving = true
	elseif sucata.input.is_held("right", "d") and self.x < 492 then
		self.x = self.x + self.speed * dt
		self.inclination = math.min(4, self.inclination + (20 * dt))
		moving = true
	end

	if not moving then
		if self.inclination < 2 then
			self.inclination = math.min(2, self.inclination + (20 * dt))
		elseif self.inclination > 2 then
			self.inclination = math.max(2, self.inclination - (20 * dt))
		end
	end
end

return Player
