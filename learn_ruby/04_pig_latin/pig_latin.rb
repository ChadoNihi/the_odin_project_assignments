#vowels=['a','e','i','o','u','y']

def translate(str)
	spl=str.split(" ")
	i=0
	spl.each do |word|
		capitalized=false
		if word.capitalize == word
			capitalized=true
		end
		revw=word.reverse.split("")
		if word=~/^[aeiouy]/i 
			revw.each do |ch|
				if ch.match(/^[[:alpha:]]$/)
					word=word[0..word.rindex(ch)]<<"ay"<<word[word.rindex(ch)+1..-1]
					break
				end
			end
		elsif word=~/^[b-df-hj-np-tv-xz][aeiouy]/i
			if word[0..1].downcase=="qu"
				if word[2].match(/^[aeiouy]/i)
					revw.each do |ch|
						if ch.match(/^[[:alpha:]]$/)
							word=word[2..word.rindex(ch)]<<"qu"<<"ay"<<word[word.rindex(ch)+1..-1]
							break
						end
					end
				else
					revw.each do |ch|
						if ch.match(/^[[:alpha:]]$/)
							word=word[2..word.rindex(ch)]<<word[0..2]<<"ay"<<word[word.rindex(ch)+1..-1]
							break
						end
					end
				end
			else
				revw.each do |ch|
					if ch.match(/^[[:alpha:]]$/)
						word=word[1..word.rindex(ch)]<<word[0]<<"ay"<<word[word.rindex(ch)+1..-1]
						break
					end
				end
			end
		elsif word=~/^[b-df-hj-np-tv-xz][b-df-hj-np-tv-xz][aeiouy]/i
			if word[1..2].downcase=="qu"
				if word[3].match(/^[aeiouy]/i)
					revw.each do |ch|
						if ch.match(/^[[:alpha:]]$/)
							word=word[3..word.rindex(ch)]<<word[0..2]<<"ay"<<word[word.rindex(ch)+1..-1]
							break
						end
					end
				else
					revw.each do |ch|
						if ch.match(/^[[:alpha:]]$/)
							word=word[3..word.rindex(ch)]<<word[0..2]<<"ay"<<word[word.rindex(ch)+1..-1]
							break
						end
					end
				end
			else
				revw.each do |ch|
					if ch.match(/^[[:alpha:]]$/)
						word=word[2..word.rindex(ch)]<<word[0..1]<<"ay"<<word[word.rindex(ch)+1..-1]
						break
					end
				end
			end
		else
			if word[2..3].downcase=="qu"
				revw.each do |ch|
						if ch.match(/^[[:alpha:]]$/)
							word=word[4..word.rindex(ch)]<<"qu"<<"ay"<<word[word.rindex(ch)+1..-1]
							break
						end
				end
			else
				revw.each do |ch|
					if ch.match(/^[[:alpha:]]$/)
						word=word[3..word.rindex(ch)]<<word[0..2]<<"ay"<<word[word.rindex(ch)+1..-1]
						break
					end
				end
			end
			
		end
		spl[i]= (capitalized ? word.capitalize : word)
		i+=1
	end
	spl.join(" ")
end