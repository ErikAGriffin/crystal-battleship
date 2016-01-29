require "./spec_helper"
require "../src/ship"

describe GameBoard do


  it "exists" do
    board = GameBoard.new
    board.should_not eq nil
  end

  it "has a grid" do
    board = GameBoard.new
    board.grid.should eq template_grid
  end

  it "can place a ship" do
    board = GameBoard.new
    ship = Ship.new
    board.place(0,0,ship)
    board.grid[0][0].should eq ship
    board.grid[0][1].should eq ship
    board.grid[0][2].should eq ship
    board.grid[1][0].should eq :SEA
  end

  it "cannot place a ship off the board" do
    board = GameBoard.new
    expect_raises do
      board.place(9,0,Ship.new)
    end
  end

  it "can receive a shot to a cell" do
    board = GameBoard.new
    board.place(0,0,Ship.new)
    board.shoot(9,9).should eq :MISS
    board.shoot(2,0).should eq :HIT
  end

  it "will miss if you shoot the same place again" do
    board = GameBoard.new
    board.place(0,0,Ship.new)
    board.shoot(0,0).should eq :HIT
    board.shoot(0,0).should eq :MISS
  end

end

def template_grid
  grid = [] of Array(Symbol|Ship)
  while grid.size < 10
    row = [] of Symbol|Ship
    while row.size < 10
      row << :SEA
    end
    grid << row
  end
  grid
end