local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
--local task_list = require('widget.task-list')

local top_panel = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(1050)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width  / 4  - 5  ,  -- offsetx - 5,
		x = s.geometry.width * 3/4,  -- + offsetx,
		y = s.geometry.y + 5,
		stretch = false,
		bg = beautiful.background,
		fg = beautiful.fg_normal,
		margins = dpi(10),
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, dpi(13))
		end
	}


	--local panel = wibox
	--{
	--	ontop = true,
	--	screen = s,
	--	type = 'dock',
	--	height = dpi(28),
	--	width = s.geometry.width  - offsetx - 10,
	--	x = s.geometry.x + offsetx,
	--	y = s.geometry.y + 10,
	--	stretch = false,
	--	bg = beautiful.background,
	--	fg = beautiful.fg_normal,
	--	--margins = dpi(10)
	--}


	panel:struts
	{
		top = dpi(33)
	}

	panel:connect_signal(
		'mouse::enter',
		function()
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end
	)

	s.systray = wibox.widget {
		visible = false,
		base_size = dpi(20),
		horizontal = true,
		screen = 'primary',
		opacity = 1,
		widget = wibox.widget.systray()
	}

	--local clock 			= require('widget.clock')(s)
	local layout_box 		= require('widget.layoutbox')(s)
	--local add_button 		= require('widget.open-default-app')(s)
	s.tray_toggler  		= require('widget.tray-toggle')
	--s.updater 				= require('widget.package-updater')()
	--s.screen_rec 			= require('widget.screen-recorder')()
	s.mpd       			= require('widget.mpd')()
	--s.bluetooth   			= require('widget.bluetooth')()
	s.battery     			= require('widget.battery')()
	--s.network       		= require('widget.network')()
	s.info_center_toggle	= require('widget.info-center-toggle')()
	mykeyboardlayout = awful.widget.keyboardlayout()



	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = 'true',
		{
			layout = wibox.layout.fixed.horizontal,
			--task_list(s),
			--add_button
		},
		clock,
		{
			layout = wibox.layout.fixed.horizontal,
			spacing = dpi(1),
			{
				s.systray,
				margins = dpi(5),
				widget = wibox.container.margin
			},
			{
			layout = wibox.layout.fixed.horizontal,
			s.tray_toggler,
			--s.updater,
			--s.screen_rec,
			s.mpd,
			--s.bluetooth,
			--s.network,
			s.battery,
			mykeyboardlayout,
			layout_box,
			s.info_center_toggle
			},
		}
	}

	return panel
end


return top_panel
