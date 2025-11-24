local Object = require("classic")

local UI = Object:extend()

function UI:draw()
	sucata.graphic.draw_text({
		text = "Life: " .. Life,
		x = 500,
		y = 10,
		font_size = 24,
		align = "right",
		font = "src://fonts/PixelatedElegance.ttf"
	})
	sucata.graphic.draw_text({
		text = "Points: " .. Points,
		x = 500,
		y = 40,
		font_size = 24,
		align = "right",
		font = "src://fonts/PixelatedElegance.ttf"
	})
end

return UI
