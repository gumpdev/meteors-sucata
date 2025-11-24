local Player = require("player")
local Meteor = require("meteor")
local UI = require("ui")

sucata.window.set_window_size(512, 512)
sucata.window.set_window_title("Meteors Sucata")
sucata.window.set_keep_aspect(true)

Life = 5
Points = 0

function SpawnMeteor()
	sucata.scene.spawn(Meteor())
end

sucata.time.create_timer(SpawnMeteor, {
	time = 3.0,
	loop = true,
	auto_start = true
})

sucata.scene.load_scene({ Player(32, 480), UI() })
