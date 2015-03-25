class Cell

  attr_accessor :position

  def initialize(state = {})
    @world = state[:world]
    @alive = state[:alive]
    @alive = true if state[:alive].nil?
    @position = state[:position]
    @live_neighbors = 0
    @neighbors = []
  end

  def alive?
    @alive
  end

  def dead?
    !alive?
  end

  def live_neighbors
    @neighbors.select(&:alive?)
  end

  def set_neighbors
    @neighbors = @world.neighbors_for(@position)
  end

  def process_evolution
    live_neighbors.count
    die unless [2, 3].include? live_neighbors.count
    come_to_life if live_neighbors.count == 3
  end

  def come_to_life
    @alive = true
  end

  def die
    @alive = false
  end

end