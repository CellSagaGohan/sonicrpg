return {
    image = "fleet.png",
    starting = "flyleft",
    w = 47,
    h = 55,

    animations = {
        flyleft = {
			frames = {{9,4}}
		},
		meeting_idledown = {
			frames = {{0,2}},
			clip = {0,0,47,42}
		},
		meeting_idleup = {
			frames = {{0,6}}
		},
		meeting_idleup_lookleft = {
			frames = {{0,5}}
		},
		meeting_lookright = {
			frames = {{1,5}},
			clip = {0,0,47,42}
		},
		meeting_smirkright = {
			frames = {{10,4}},
			clip = {0,0,47,42}
		},
    }
}