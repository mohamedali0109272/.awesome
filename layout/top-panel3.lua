local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local icons = require('theme.icons')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widget.clickable-container')
local task_list = require('widget.task-list')

local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()


local top_panel2 = function(s, offset)

	local offsetx = 0
	if offset == true then
		offsetx = dpi(535) --dpi(660)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = 340 ,--s.geometry.width  - 1300, --625,
		x = s.geometry.width / 2 - 145 ,--+ offsetx,
		y = s.geometry.y + 5,
		stretch = false,
		bg = beautiful.background, 
		fg = beautiful.fg_normal,
		shape = function(cr, w, h)
			gears.shape.rounded_rect(cr, w, h, dpi(13))
		end
		--margins = dpi(10)
	}


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

	--s.systray = wibox.widget {
	--	visible = false,
	--	base_size = dpi(20),
	--	horizontal = true,
	--	screen = 'primary',
	--	widget = wibox.widget.systray({fg='#00000000'})
	--}

	local clock 			= require('widget.clock')(s)
	local cpu  = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status/cpu.sh',0)
	local ram = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status/ram.sh',2)
	local temp = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status/temp.sh',5)
	local netspeed = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status/netspeed.sh',1)
	--local swap = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status/swap.sh',1)
	--local status = awful.widget.watch('sh -c ' .. config_dir .. '/configuration/status.sh',1)
	--local layout_box 		= require('widget.layoutbox')(s)
	--local add_button 		= require('widget.open-default-app')(s)
	--s.tray_toggler  		= require('widget.tray-toggle')
	--s.updater 				= require('widget.package-updater')()
	--s.screen_rec 			= require('widget.screen-recorder')()
	--s.mpd       			= require('widget.mpd')()
	--s.bluetooth   			= require('widget.bluetooth')()
	--s.battery     			= require('widget.battery')()
	--s.network       		= require('widget.network')()
	--s.info_center_toggle	= require('widget.info-center-toggle')()
	
	-- status:buttons(
	-- 	gears.table.join(
	-- 		awful.button(
	-- 			{},
	-- 			1,
	-- 			nil,
	-- 			function()
	-- 				awful.spawn.easy_async_with_shell("st htop")
	-- 			end
	-- 		)
	-- 	)
	-- )
	
	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = 'true',
		{
			layout = wibox.layout.fixed.horizontal,
			--clock,
			--task_list(s),
			--add_button
			--myupdates,
			cpu,
			ram,
			clock,
			temp,
			netspeed
			--status
		}--, 
		--clock,
		--{
		--	layout = wibox.layout.fixed.horizontal,
		--	temp,
		--	netspeed
		--	spacing = dpi(0.5),
		--	{
		--		s.systray,
		--		margins = dpi(5),
		--		widget = wibox.container.margin
		--	},
		--	s.tray_toggler,
		--	s.updater,
		--	s.screen_rec,
		--	s.mpd,
		--	s.network,
		--	s.bluetooth,
		--	s.battery,
		--	layout_box,
		--	s.info_center_toggle
		--}
	}

	return panel
end


return top_panel2
