require "./spec_helper"

describe Battleship do

  it "is landscape by default" do
    ship = Ship.new
    ship.landscape?.should be_true
  end

  it "has a default size of 3" do
    ship = Ship.new
    ship.size.should eq 3
    ship.health.should eq 3
  end

  it "takes hits to lose health" do
    ship = Ship.new
    ship.health.should eq 3
    ship.hit
    ship.health.should eq 2
  end

  it "sinks when health is 0" do
    ship = Ship.new
    3.times {ship.hit}
    ship.sunk?.should be_true
  end

end
