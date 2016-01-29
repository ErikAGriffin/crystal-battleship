class Ship

  def initialize
    @size = 3
    @health = @size
    @landscape = true
  end

  def landscape?
    @landscape
  end

  def sunk?
    @health == 0
  end

  def size
    @size
  end

  def health
    @health
  end

  def hit
    @health -= 1
  end

end