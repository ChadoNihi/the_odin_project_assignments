class Book
	attr_reader :title
	def title=(str)
		@title=str.capitalize.split(" ").map {|w| ['a','the','an','in','over','at','on','in','and','of'].include?(w) ? w : w.capitalize}.join(" ")
	end
end