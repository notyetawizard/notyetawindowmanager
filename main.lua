--[[
TODO:
  Set up handling for all events wew sends and nil, even if they're just a return.
  Window focus on mouse enter event? (7)
--]]


--Example: Can't just use os.execute, as that doesn't return the output!
--winlist = io.popen("lsw",r)
--print(winlist:read("*a"))

--Event handler?
events = io.popen("wew",r)
--read line by line in a loop, but *don't* skip lines accidentally!
--do things :D
