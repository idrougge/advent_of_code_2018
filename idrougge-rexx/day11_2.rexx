/* Advent of code 2018, day 11, part 2 in ANSI REXX */
serial = 9424

say power(3,5,8) = 4
say power(122,79,57) = -5
say power(217,196,39) = 0
say power(101,153,71) = 4

map. = 0
original. = 0
do y = 1 to 300
	do x = 1 to 300
		map.x.y = power(x,y,serial)
		original.x.y = map.x.y
	end
end

say map.3.5
call drawrow 5



top = 0
do w = 1 to 300
	say w
	do y = 1 to 300 - w
		call sumrow y,w
	end
	do y = 1 to 300 - w
		do x = 1 to 300 - w
			n = map.x.y
			do o = y + 1 for w
				n = n + map.x.o
			end
			if n > top then do
				top = n
				p = x','y','w+1
			end
		end
	end
end
say top
say p
exit

power: procedure expose serial
arg x,y,s
rack = x + 10
p = rack * y + s
p = p * rack
parse var p '' -3 p+1
p = p - 5
return p

drawrow: procedure expose map.
arg y
line = ''
do x = 1 to 40
	line = line map.x.y
end
say line
return

sumrow: procedure expose map. original.
arg y,w
/*say y','w*/
do x = 1 to 300 - w
	o = x + w
	/*
	say x':'o
	say map.x.y '-' original.o.y
	*/
	map.x.y = map.x.y + original.o.y
end
return
/*
01 02 03 04 05 06 07
06 09 12 15 18 -- --

 1 3 4 -5 -3 -1 0 2 4 -4 -2 0 3 -5 -2 0 3 -4 -1 2 -5 -2 2 -5 -1 2 -4 0 4 -2 2 -4 0 -5 -1 4 -1 4 -2 4
 1 3 4 -5 -3 -2 0 2 4 -4 -2 0 3 -5 -2 0 3 -4 -1 2 -5 -2 1 -5 -2 2 -4 0 4 -2 2 -4 0 -5 -1 4 -1 3 -2 3 -1
       -5 -3 -2 0 2 4 -4 -2 1 3 -5 -2 1 3 -4 -1 2 -5 -1 2 -4 -1 3 -3 0 4 -2 3 -3 1 -4 0 -5 0 -5 0 -5 0 -5 1

*/