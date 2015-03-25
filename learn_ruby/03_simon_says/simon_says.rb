def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(str,n=2)
    n==1 ? str : str + " "+ repeat(str,n-1)
end

def start_of_word(str,n)
	str[0..n-1]
end

def first_word(str)
	spl=str.split(" ")
	spl[0]
end

def titleize(str)
	spl=str.split(" ")
	spl.each do |word|
		word.capitalize! unless spl.index(word) != 0 && (word == "the" || word == "over" || word == "and")
	end
	spl.join(" ")
end