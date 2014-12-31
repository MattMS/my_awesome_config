-- Standard awesome library.
require("awful")

-- Notification library.
require("naughty")


if awesome.startup_errors then
	naughty.notify {
		preset = naughty.config.presets.critical,
		text = awesome.startup_errors,
		title = "There were errors during startup!"
	}
end


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


global_keys = {}

global_keys = awful.util.table.join(
	global_keys,
	awful.key({KEY.MOD, KEY.CONTROL}, "r", awesome.restart),
	awful.key({KEY.MOD, KEY.CONTROL}, "q", awesome.quit)
)

-- Tag relative movement.
global_keys = awful.util.table.join(
	global_keys,
	awful.key({KEY.MOD,}, KEY.LEFT, awful.tag.viewprev),
	awful.key({KEY.MOD,}, KEY.RIGHT, awful.tag.viewnext)
)

-- Tag numbers.
for i = 1, TAG_COUNT do
	global_keys = awful.util.table.join(
		global_keys,
		awful.key({KEY.MOD}, "#" .. i + 9, function ()
		end)
	)
end

global_keys = awful.util.table.join(
	global_keys,
	awful.key({KEY.MOD,}, KEY.RETURN, function ()
		awful.util.spawn(TERMINAL)
	end)
)

root.keys(global_keys)
