class RPNCalculator

	def initialize
		@stack=Array.new
	end

	def push(n)
		@stack<<n unless n.nil?
	end

	def plus
		calc(@stack[-2], @stack[-1]) {|a,b| a+b}
	end

	def minus
		calc(@stack[-2], @stack[-1]) {|a,b| a-b}
	end

	def times
		calc(@stack[-2], @stack[-1]) {|a,b| a*b}
	end

	def divide
		calc(@stack[-2], @stack[-1]) {|a,b| a.to_f/b}
	end

	def value
		@stack[-1]
	end

	def evaluate(str)
		tokens(str).each do |tok|
			case tok
			when Numeric
				push(tok)
			when :+
				plus
			when :-
				minus
			when :*
				times
			when :/
				divide
			else
				puts "accepts: numbers&arih.operators"
			end
		end
		value
	end

	def tokens(str)
		str.split(" ").collect! {|ch| ['+','-','*','/'].include?(ch) ? ch.to_sym : ch.to_i}
	end

	private

	def calc(a,b)
		raise "calculator is empty" unless @stack.size>1
		res=yield(a,b)
		@stack.insert(-3, res).delete_at(-1)
		@stack.delete_at(-1)
	end
end