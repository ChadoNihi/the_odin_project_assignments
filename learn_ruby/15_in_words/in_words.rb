class Integer
	def in_words
		number=self
		words={0=>"zero", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six",  7=>"seven",
			8=>"eight",  9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve",  13=>"thirteen",
			15=>"fifteen",  18=>"eighteen",  20=>"twenty", 30=>"thirty", 40=>"forty",
			50=>"fifty", 80=>"eighty"}

		return words[number] if words.has_key?(number)
		return words[number % 10]+"teen" if number<20

		if number<100
			frstdig=number/10
			frstdrounded=frstdig*10
			if words.has_key?(frstdrounded)
				return "#{words[frstdrounded]}#{" "+words[number-frstdrounded] unless number==frstdrounded}"
			else
				return "#{words[frstdig]}ty#{" "+words[number-frstdrounded] unless number==frstdrounded}"
			end
		end


		ranks={3=>"hundred", 4=>"thousand", 7=>"million",
			10=>"billion", 13=>"trillion"}

		chdigits=number.to_s.split('')
		len=chdigits.length
		rank=3
		case len
		when 3
		when 4..6
			rank=4
		when 7..9
			rank=7
		when 10..12
			rank=10
		when 13..15
			rank=13
		else
			return "googol"
		end
		diff=len-rank
		return "#{chdigits[0..diff].join.to_i.in_words} #{ranks[rank]}#{" "+chdigits[diff+1..-1].join.to_i.in_words unless (chdigits[-3..-1]==['0','0','0'] or (rank==3 and chdigits[-2..-1]==['0','0']))}"
	end
end