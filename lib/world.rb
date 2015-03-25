require_relative 'cell'

class World
  
  attr_accessor :cells

  def initialize
    @cells = []
  end

  def to_s
    display
  end

  def add_cells(cells = [])
    @cells += cells
  end

  def add_one_cell(cell)
    @cells << cell
  end

  def neighbors_for(position)
    neighbors_for_position(position[0], position[1])
  end

  def neighbors_for_position(x,y)
    @cells.select do |cell|
      (cell.position[0] - x).abs <= 1 &&
      (cell.position[1] - y).abs <= 1
    end
  end

  def populate(x, y)
    @width = x
    (0..x-1).each do |x_position|
      (0..y-1).each do |y_position|
        new_cell = Cell.new(world: self, position: [x_position, y_position], alive: [true, false].sample)
        add_one_cell(new_cell)
      end
    end
  end

  def set_neighbors
    @cells.each(&:set_neighbors)
  end

  def process_evolution
    @cells.each(&:live_neighbors)
    @cells.each(&:process_evolution)
    self
  end
 

  def display
    @cells.collect{ |cell| cell.alive? ? '◼' : '.' }.join.scan(/.{#{@width}}/).join("\n")
  end

end