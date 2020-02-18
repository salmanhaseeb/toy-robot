require './face.rb'
require './position.rb'

class ToyRobot
  def initialize(moves, x, y, face)
    @moves = moves
    @position = Position.new(x, y)
    @face = Face.new(face)
  end
  
  def play
    return "invalid command" if @position.x < 0 || @position.x > 4 || @position.y < 0 || @position.y > 4

    return "invalid command" if @face.current != @face.current.upcase || !@face.valid_face?(@face.current)

    @moves.each do |move|
      return "invalid command" if move != move.upcase || !valid_move?(move)
    end

    # Moves
    @moves.each_with_index do |move, index|
      if move == "MOVE" and is_valid?(@face.current, move, @position.x, @position.y)
        @position.update(@face.current)
      elsif move == "REPORT"
        puts @position.x
        puts @position.y
        puts @face.current
        return {x: @position.x, y: @position.y, face: @face.current}
      elsif move == "RIGHT" || move == "LEFT"
        # face right
        @face.update(move)
      end
    end
  end

  def valid_move?(move)
    ["MOVE", "LEFT", "RIGHT", "REPORT"].include?(move)
  end

  def is_valid?(face, move, x, y)
    if face == "NORTH" && x >= 4
      false
    elsif face == "SOUTH" && x <= 0
      false
    elsif face == "EAST" && y >= 4
      false
    elsif face == "WEST" && y <= 0
      false
    else
      true
    end
  end
end