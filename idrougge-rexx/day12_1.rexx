/* REXX */
fn = 'day12.txt'

parse value linein(fn) with 'initial state: ' state
call linein fn /* Skip empty line */

do while lines(fn)
	parse value linein(fn) with in ' => ' out .
	queue in out
end

state = '...'state'...'
z = 4
say state
test = 'day12c.txt'
call linein test

do # = 1 for 20
	next = copies('.', length(state))
	do @ = 1 to length(state) - 2
		do queued()
			pull in out
			queue in out
			if abbrev(substr(state, @, 5), in) then do
				/*
				say copies(' ', @ - 1) || substr(state, @, 5)
				say copies(' ', @ - 1) || in '=>' out
				*/
				next = overlay(out, next, @ + 2)
				/*
				say state
				say next
				*/
			end
		end
	end
	state = '.'next'.'
	say #':' next
	muster = linein(test)
	parse var muster . muster
	say #':' muster abbrev(muster, next)
end
say state
say next
muster = '...#...#....#.....#..#..#..#...........'
say muster
say abbrev(muster, next)
sum = 0
do @ = 1 to length(state)
	if substr(state, @, 1) = '#' then sum = sum + (@ - z - # + 1)
end
say sum
