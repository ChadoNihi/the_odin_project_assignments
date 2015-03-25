class Temperature
	def initialize(h)
		@temp=h
	end

	def in_fahrenheit
		@temp[:f].nil? ? ctof(@temp[:c]) : @temp[:f]
	end

	def in_celsius
		@temp[:c].nil? ? ftoc(@temp[:f]) : @temp[:c]
	end

	def self.from_celsius(tc)
		Temperature.new({:c => tc})
	end

	def self.from_fahrenheit(th)
		Temperature.new({:f => th})
	end

	def ftoc(fT)
		5.0/9.0 * (fT-32)
	end

	def ctof(cT)
		9.0/5.0*cT+32
	end
end

class Celsius < Temperature
	def initialize(tc)
		@temp=tc
	end

	def in_celsius
		@temp
	end

	def in_fahrenheit
		ctof(@temp)
	end
end

class Fahrenheit < Temperature
	def initialize(tf)
		@temp=tf
	end

	def in_celsius
		ftoc(@temp)
	end

	def in_fahrenheit
		@temp
	end
end