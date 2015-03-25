require_relative 'world'

x_size = 50
y_size = 30
set_evolution = 50

world = World.new
world.populate x_size, y_size

(1..set_evolution).each do |turn|
  puts "\n"
  puts world
  world.process_evolution
  sleep 0.3
end

puts "\n\nThat's all folks!"