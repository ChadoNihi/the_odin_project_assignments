class Dictionary
	attr_accessor :entries
	def initialize(d={})
		@entries=d
	end

	def keywords
		@entries.keys
	end

	def add(arg)
		if arg.is_a? Hash 
			@entries.merge!(arg)
		else 
			@entries.update(arg => nil)
		end
	end

	def include?(arg)
		keywords.include?(arg) ? true : false
	end

	def find(arg)
		if include?(arg)
			{arg => @entries}
		else
			{}
		end
	end
end