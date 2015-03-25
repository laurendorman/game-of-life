require 'spec_helper'
require_relative '../lib/world'

describe World do

  it 'populates and creates cell objects' do
    world = World.new
    world.populate(1, 1)
    expect(world.cells.first).to eq(@cell)
  end

  it 'creates cells with a position' do
    world = World.new
    world.populate(1, 1)
    expect(world.cells.first.position.length).to eq(2)
  end

  it 'has the correct number of cells' do
    world = World.new
    world.populate(8, 4)
    expect(world.cells.count).to eq(32)
  end

  it 'processes each cell' do
    world = World.new
    cell = Cell.new(world: world)
    processing = cell.process_evolution
    expect(processing).to eq(process_evolution)
  end

end