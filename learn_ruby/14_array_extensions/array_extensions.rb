class Array
	def sum
		self.inject(0,:+)
	end

	def square
		self.map {|el| el*el}
	end

	def square!
		self.map! {|el| el*el}
	end
end