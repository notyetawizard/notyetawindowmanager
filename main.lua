--[[
TODO:
  - Set up handling for all events wew sends and nil, even if they're just a return.
  - Window focus on mouse enter event? (7)
  - Manage the windows in a stack with chwso; when mouse enters, a window should maybe gain temporary focus, but only for mouse events like clicking and scrolling—though scrolling may work without focus, which would be nice. The window that *had* focus prior to the mouse entry should regain focus on keyboard events, perhaps?
  - Fancy border colours! I think the border on the (main) focused window should be bigger.
  - user defined grid, like parking spaces, with padding. Programs can have reserved spaces, and anything else will get out of their way. Windows that have defined spaces will automatically go to them, programs that don't may be left floating or find an unoccupied space. Should be able to be different per virtual desktop
  - look into panning with xorg and xrandr, ideally disabling mouse panning, which sounds super annoying.
--]]


--panning widthxheight[+x+y[/track_widthxtrack_height+track_x+track_y[/border_left/border_top/border_right/border_bottom]]]
--This option sets the panning parameters. As soon as panning is enabled, the CRTC position can change with every pointer move. The first four parameters specify the total panning area, the next four the pointer tracking area (which defaults to the same area). The last four parameters specify the border and default to 0. A width or height set to zero disables panning on the according axis. You typically have to set the screen size with --fb simultaneously.

--Example: Can't just use os.execute, as that doesn't return the output!
--winlist = io.popen("lsw",r)
--print(winlist:read("*a"))

--Event handler?
events = io.popen("wew",r)
--read line by line in a loop, but *don't* skip lines accidentally!
while true do
  event = winlist:read("*l")
  if event == nil then
    return
  end
end
