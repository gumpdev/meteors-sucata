local Object = require("classic")

local Bullet = Object:extend()

function Bullet:new(x, y, speed)
	self.x = x
	self.y = y
	self.speed = speed or 300
end

function Bullet:init()
	sucata.audio.play({
		sound = "src://sounds/shoot.ogg",
		group = "sfx",
	})
end

function Bullet:draw()
	sucata.graphic.draw_rect({
		x = self.x,
		y = self.y,
		width = 16,
		height = 16,
		texture = "src://sprites/bullet.png",
		origin = 0.5
	})
end

function Bullet:update()
	self.y = self.y - self.speed * sucata.time.get_delta()
	if self.y < -16 then
		sucata.scene.destroy(self)
	end

	local meteors = sucata.scene.get_entities_by_tag("meteor")
	for _, id in ipairs(meteors) do
		local meteor = sucata.scene.find_by_id(id)
		if meteor and sucata.math.overlapping({
					x = self.x - 8,
					y = self.y - 8,
					width = 16,
					height = 16
				}, {
					x = meteor.x - 16,
					y = meteor.y - 16,
					width = 32,
					height = 32
				}) then
			meteor.health = meteor.health - 1
			if meteor.health <= 0 then
				sucata.events.emit("meteor_destroyed", meteor)
				sucata.scene.destroy(meteor)
			end
			sucata.scene.destroy(self)
			break
		end
	end
end

return Bullet
