require 'byebug'

class ToyRobot
  def initialize(moves, x, y, face)
    @moves = moves
    # row value
    @x = x

    # column value
    @y = y
    # Face, N, E, S, W
    @face = face
  end
  
  def play
    # Moves
    @moves.each_with_index do |move, index|
      if move == "MOVE" and is_valid?(@face, move, @x, @y)
        # move right
        @x = move_right(@x) if @face == "EAST"

        # move left
        @x = move_left(@x) if @face == "WEST"

        # move down
        @y = move_down(@y) if @face == "SOUTH"

        # move up
        @y = move_up(@y) if @face == "NORTH"
      elsif move == "REPORT"
        puts @x
        puts @y
        puts @face
        return {x: @x, y: @y, face: @face}
      elsif move == "RIGHT"
        # face right
        @face = face_right(@face)
      elsif move == "LEFT"
        # face left
        @face = face_left(@face)
      end
    end
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

  def move_up(position)
    position + 1
  end

  def move_down(position)
    position - 1
  end

  def move_right(position)
    position + 1
  end

  def move_left(position)
    position - 1
  end

  def face_right(face)
    if face == "NORTH"
      "EAST"
    elsif face == "EAST"
      "SOUTH"
    elsif face == "SOUTH"
      "WEST"
    elsif face == "WEST"
      "NORTH"
    else
      "invalid face"
    end
  end

  def face_left(face)
    if face == "NORTH"
      "WEST"
    elsif face == "WEST"
      "SOUTH"
    elsif face == "SOUTH"
      "EAST"
    elsif face == "EAST"
      "NORTH"
    else
      "invalid face"
    end
  end
end

def moves
  if ARGV.length > 0
    return File.read(ARGV.first)
  else
    puts STDIN.read
  end
end

def main
  data = moves.split("\n")
  # data = data.split("\n")
  place = data.first

  # row value
  x = place.split(',').first.split(' ').last.to_i

  # column value
  y = place.split(',')[1].to_i

  # Face, N, E, S, W
  face = place.split(',').last

  moves = data.drop(1)
  
  tr = ToyRobot.new(moves, x, y, face)
  tr.play
end

main
