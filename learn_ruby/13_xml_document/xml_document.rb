class XmlDocument
	def initialize(indented=false)
		@indented=indented
		@indlvl=-1
	end
	def method_missing(sym, *args, &block)
		@indlvl+=1

		if block_given?
			return "#{"  "*@indlvl if @indented}<#{sym.to_s}>#{"\n" if @indented}#{yield}#{"\n" if @indented}#{"  "*(@indlvl-=1) if @indented}</#{sym.to_s}>#{"\n" if @indlvl==0 and @indented}"
		end
		args[0] ? "#{"  "*@indlvl if @indented}<#{sym.to_s} #{args[0].keys[0]}='#{args[0].values[0]}'/>" : "<#{sym.to_s}/>#{"\n" if @indented}"
	end
end