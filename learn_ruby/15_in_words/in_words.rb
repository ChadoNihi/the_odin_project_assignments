class Fixnum
	def in_words
		number=self
		return "zero" if number == 0
		words={1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six",  7=>"seven",
			8=>"eight",  9=>"nine", 10=>"ten", 11=>"eleven", 12=>"twelve",  13=>"thirteen",
			15=>"fifteen",  18=>"eighteen",  20=>"twenty", 30=>"thirty", 40=>"forty",
			50=>"fifty", 80=>"eighty"}
		return words[number] if words.has_key?(number)
		return words[number % 10]+"teen" if number<20

		if number<100
			w=words[number/10]
			return "#{w}ty" if number%10==0
			return "#{w}ty #{w}"
		end
	end
end