def add(x,y)
	x+y
end

def subtract(x,y)
	x-y
end

def sum(args)
	args.empty? ? 0 : args.inject {|sum, x| sum+x}
end

def multiply(*args)
	args.reduce(1) {|pr,x| pr*x}
end

def power(x,y)
	x**y
end

def factorial(x)
	x==0 ? 1 : x*factorial(x-1)
end