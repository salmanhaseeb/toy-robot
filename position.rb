class Position
	attr_reader :x, :y
	def initialize(x, y)
		@x = x
		@y = y
	end

	def update(face)
		if face == "NORTH"
			@y = @y + 1
		elsif face =="SOUTH"
			@y = @y - 1
		elsif face == "WEST"
			@x = @x - 1
		elsif face == "EAST"
			@x = @x + 1
		else
		end
	end
end