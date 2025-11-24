local Object = require("classic")

local Meteor = Object:extend()
function Meteor:new()
	self.x = math.random(16, 496)
	self.y = -16
	self.speed = math.random(100, 200)
	self.health = math.random(1, 5)
end

function Meteor:init()
	sucata.scene.add_tag(self, "meteor")
end

function Meteor:update()
	local dt = sucata.time.get_delta()
	self.y = self.y + self.speed * dt
	if self.y > 528 then
		Life = Life - 1
		sucata.scene.destroy(self)
	end
end

function Meteor:draw()
	sucata.graphic.draw_rect({
		x = self.x,
		y = self.y,
		width = 32,
		height = 32,
		texture = "src://sprites/meteor.png",
		origin = 0.5,
		atlas_size = 8,
		atlas_x = self.health - 1
	})
end

return Meteor
