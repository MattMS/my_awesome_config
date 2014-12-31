local awful = require("awful")


EDITOR = os.getenv("EDITOR") or "vi"

KEY = {
	CONTROL = "Control",
	ESCAPE = "Escape",
	LEFT = "Left",
	MOD = "Mod4",
	RETURN = "Return",
	RIGHT = "Right",
	SHIFT = "Shift",
	SPACE = "space",
	TAB = "Tab"
}

SCREEN_COUNT = screen.count()

TAG_COUNT = 9

TERMINAL = os.getenv("TERM") or "xterm"


EDITOR_CMD = TERMINAL .. " -e " .. EDITOR


local layouts = {
	awful.layout.suit.max
}


tags = {}

-- Each screen has its own tag table.
for s = 1, SCREEN_COUNT do
	tags[s] = awful.tag({1, 2, 3, 4, 5, 6, 7, 8, 9}, s, layouts[1])
end


global_keys = awful.util.table.join(
	awful.key({KEY.MOD,}, KEY.LEFT, awful.tag.viewprev),
	awful.key({KEY.MOD,}, KEY.RIGHT, awful.tag.viewnext),
	awful.key({KEY.MOD,}, "h", awful.tag.viewprev),
	awful.key({KEY.MOD,}, "l", awful.tag.viewnext),

	awful.key({KEY.MOD,}, KEY.RETURN, function ()
		awful.util.spawn(TERMINAL)
	end),

	awful.key({KEY.MOD, KEY.CONTROL}, "r", awesome.restart),

	awful.key({KEY.MOD, KEY.CONTROL}, "q", awesome.quit)
)

for i = 1, TAG_COUNT do
	global_keys = awful.util.table.join(
		global_keys,
		awful.key(
			{KEY.MOD},
			"#" .. i + 9,
			function ()
			end
		)
	)
end

root.keys(global_keys)
