require 'spec_helper'
require_relative '../lib/cell'
require_relative '../lib/world'

describe Cell do

  it 'cell is alive' do
    expect(subject.alive?).to eq(true)
  end

  it 'cell on board can be assigned a position' do
    expect(Cell.new(position: [50, 50]).position).to eq([50, 50])
  end

  it 'neighbor returns cells which x position differs' do
    world = World.new
    cell_one = Cell.new(world: world, position: [0,0])
    cell_two = Cell.new(world: world, position: [1,0])
    world.add_one_cell(cell_one)
    world.add_one_cell(cell_two)
    cell_two_neighbor = world.neighbors_for(cell_two.position)
    expect(cell_two_neighbor).to include(cell_one)
  end

  it 'neighbor returns cells which x position differs' do
    world = World.new
    cell_one = Cell.new(world: world, position: [0,0])
    cell_two = Cell.new(world: world, position: [1,0])

    world.add_one_cell(cell_one)
    world.add_one_cell(cell_two)

    cell_one_neighbor = world.neighbors_for(cell_one.position)
    expect(cell_one_neighbor).to include(cell_two)
  end

  it 'returns surrounding neighbor cell' do
    world = World.new
    a_cell = Cell.new(world: world, position: [-1, -1])
    
    @cells = []
    @cells << a_cell
    
    world.add_one_cell(a_cell)
    @neighbors = world.neighbors_for([0, -1])

    expect(@neighbors).to include(a_cell)
  end

  it 'returns only the surrounding cells' do
    world = World.new

    cells = []
    cells << Cell.new(position: [1, -1])
    cells << Cell.new(position: [-1, -1])
    cells << Cell.new(position: [-1, 0])
    cells << Cell.new(position: [0, 1])
    cells << Cell.new(position: [0, -1])
    cells << Cell.new(position: [1, -1])
    cells << Cell.new(position: [1, 1])
    
    world.add_cells(cells)
    @neighbors = world.neighbors_for_position([0,0])

    expect(cells).to eq(@neighbors)
  end

  xit 'cell with no neighbors dies' do
    test_cell = []
    test_cell << Cell.new(position: [1, 0])
    
    test_cell.set_neighbors = 0

    test_cell.process_evolution

    expect(test_cell).to eq(dead)
  end

  context 'a cell with two neighbors' do
    before do
      [[0, 1], [1, 0]].each do |sequence|
      Cell.new(world: world, position: sequence)
      end
    end
    xit 'lives on' do
      cell.set_neighbors
      cell.process_evolution
      expect(cell).to eq(alive)
    end
  end

  context 'a cell with three neighbors' do
    before do
      [[0, 1], [1, 0], [1, 1]].each do |sequence|
      Cell.new(world: world, position: sequence)
      end
    end
    xit 'lives on' do
      cell.set_neighbors
      cell.process_evolution
      expect(cell).to eq(alive)
    end
  end

  context 'a cell with four neighbors' do
    before do
      [[0, 1], [1, 0], [1, 1], [-1, -1]].each do |sequence|
      Cell.new(world: world, position: sequence)
      end
    end
    xit 'dies' do
      cell.set_neighbors
      cell.process_evolution
      expect(cell).to eq(dead)
    end
  end

  context 'a dead cell with three neighbors' do
    before do
      cell.send(:die)
      [[0, 1], [1, 0], [1, 1]].each do |sequence|
      Cell.new(world: world, position: sequence)
      end
    end
    xit 'becomes alive' do
      cell.set_neighbors
      cell.process_evolution
      expect(cell).to eq(alive)
    end
  end

end