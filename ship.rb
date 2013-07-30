require "rspec/autorun"

class Ship
  
end

class Ships

end

class Board
  def initialize
    @grid = Array.new(10, Array.new(10, CellBuilder.call))
  end

  def get_cell(x, y)
    @grid[x][y]
  end

  def shoot(x, y)
    get_cell(x, y).shoot
  end
end

class Cell
  attr_accessor :state

  def initialize(args)
    @state = args[:state]
  end

  def shoot
    self.state = :missed
  end
end

module CellBuilder
  def self.call
    Cell.new(:state => :empty) 
  end
end

describe CellBuilder do
  it "should build a an empty cell" do 
    result = CellBuilder.call
    expect(result.state).to eq(:empty)
    expect(result.class.name).to eq("Cell")
  end
end

describe Board do
  let(:board) {Board.new}
  context "Cell creation" do
    it "should create an empty board" do
      expect(board.get_cell(0, 0).state).to eq(:empty)
      expect(board.get_cell(9, 9).state).to eq(:empty)
    end
  end
  
  context "Firing at grid" do
    before do
      board.shoot(0,0)
    end
    it "has an empty state" do

    end
  end
end

describe Cell do
  it "should receive shoot" do
    cell = CellBuilder.call
    cell.shoot
    expect(cell.state).to eq(:missed)
  end
end

describe Ships do
  let(:ships) {Ships.new}
  it "should place a ship" do
    ships.place(x:0, y: 0, size: 3, direction: :x)
  end
end
