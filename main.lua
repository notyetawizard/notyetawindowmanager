--Can't just use os.execute, as that doesn't return the output!
winlist = io.popen("lsw",r)
print(winlist:read("*a"))
