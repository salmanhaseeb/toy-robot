class Face
	attr_reader :current
	def initialize(current)
		@current = current
	end

	def update(command)
		if command == "LEFT"
			if @current == "NORTH"
	      @current = "WEST"
	    elsif @current == "WEST"
	      @current = "SOUTH"
	    elsif @current == "SOUTH"
	      @current = "EAST"
	    elsif @current == "EAST"
	      @current = "NORTH"
	    else
	      "invalid face"
	    end
		elsif command == "RIGHT"
			if @current == "NORTH"
	      @current = "EAST"
	    elsif @current == "EAST"
	      @current = "SOUTH"
	    elsif @current == "SOUTH"
	      @current = "WEST"
	    elsif @current == "WEST"
	      @current = "NORTH"
	    else
	      "invalid face"
	    end
		else
			"invalid command"
		end	
	end

  def valid_face?(face)
	  ["NORTH", "EAST", "SOUTH", "WEST"].include?(@current)
	end
end