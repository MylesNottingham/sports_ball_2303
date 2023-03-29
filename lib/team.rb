class Player
  attr_reader  :roster,
               :player_count

  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
    @player_count = 0
  end
end