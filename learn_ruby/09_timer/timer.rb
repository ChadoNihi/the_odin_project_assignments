class Timer
	attr_accessor :seconds

	def initialize
		@seconds=0
	end

	def time_string
		if @seconds<60
			return "00:00:"+padded(@seconds)
		end
		minutes=@seconds/60
		hours=minutes/60
		"#{padded(hours % 24)}:#{padded(minutes % 60)}:#{padded(@seconds % 60)}"
	end

	def padded(n)
		n/10==0 ? n.to_s.insert(0, "0") : n.to_s
	end
end