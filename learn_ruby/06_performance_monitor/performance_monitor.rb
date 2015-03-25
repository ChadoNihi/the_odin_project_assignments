require "time"

def measure(n=1)
	startT=Time.now
	n.times {yield}
	(Time.now-startT)/n
end