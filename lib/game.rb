require_relative 'cell'
require_relative 'world_new'

class Game
  if ARGV.empty?
    w = World.new(20,20)
    w.build
    w.run
  elsif ARGV[0] && ARGV[1]
    x = ARGV[0].to_i
    y = ARGV[1].to_i
    w = World.new(x, y)
    w.build
    w.run
  else
    puts "Please enter two values"
  end
end

Game
