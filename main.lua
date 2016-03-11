#!/usr/bin/lua

--[[
TODO:
  - Set up handling for all events wew sends and nil, even if they're just a return.
  - Window focus on mouse enter event? (7)
  - Manage the windows in a stack with chwso; when mouse enters, a window should maybe gain temporary focus, but only for mouse events like clicking and scrolling—though scrolling may work without focus, which would be nice. The window that *had* focus prior to the mouse entry should regain focus on keyboard events, perhaps?
  - Fancy border colours! I think the border on the (main) focused window should be bigger.
  - user defined grid, like parking spaces, with padding. Programs can have reserved spaces, and anything else will get out of their way. Windows that have defined spaces will automatically go to them, programs that don't may be left floating or find an unoccupied space. Should be able to be different per virtual desktop
--]]

local border_active = {"800080", "4"}
local border_inactive = {"008080", "4"}
local function activate(wid)
    os.execute("wtf "..wid)
    os.execute("chwso -r "..wid)
    os.execute("chwb -c "..border_active[1].." -s "..border_active[2].." "..wid)
end

local function deactivate(wid)
    os.execute("chwb -c "..border_inactive[1].." -s "..border_inactive[2].." "..wid)
end

--Event handler?
--"wew -m 524336" shows enter + leaving windows, and creation/destruction events. Add the numbers from "wew -l" together to get the combos you want!
local events = io.popen("wew -m 524336",r)
--read line by line in a loop, but *don't* skip lines accidentally!
while true do
    local event = events:read("*l")
    local colon = event:find(":")
    local value = event:sub(1, colon-1)
    local wid = event:sub(colon+1)
        print(event)
    -- New window is created
    if value == "16" then
        deactivate(wid)
    elseif value == "7" then
        activate(wid)
    elseif value == "8" then
        deactivate(wid)
    else print(event)
    end
end
