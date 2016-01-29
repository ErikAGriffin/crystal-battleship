class GameBoard

  def initialize
    @grid = create_grid
  end

  def grid
    @grid
  end

  def shoot(x,y)
    cell = grid[y][x]
    if cell.is_a? Ship
      cell.hit
      grid[y][x] = :SEA
      :HIT
    else
      :MISS
    end
  end

  def place(x,y,ship)
    grid[y][x] = ship
    i = 1
    if ship.landscape?
      while i < ship.size
        grid[y][x+i] = ship
        i+=1
      end
    else
      while i < ship.size
        grid[y+i][x] = ship
        i+=1
      end
    end
  end

  private def create_grid
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


end