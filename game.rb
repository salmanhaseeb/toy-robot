require './toy_robot.rb'

def moves
  if ARGV.length > 0
    return File.read(ARGV.first)
  else
    puts STDIN.read
  end
end

def main
  data = moves.split("\n")
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
