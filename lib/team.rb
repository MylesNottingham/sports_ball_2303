class Team
  attr_reader :roster

  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end

  def player_count
    @roster.count
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    @roster.find_all { |player| player.contract_length > 24 }
  end

  def short_term_players
    @roster.find_all { |player| player.contract_length <= 24 }
  end

  def total_value
    @roster.map { |player| player.total_cost }.sum
  end

  def details
    { "total_value" => total_value, "player_count" => player_count }
  end
end
