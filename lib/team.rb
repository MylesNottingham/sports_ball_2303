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
    (@roster.map &:total_cost).sum
  end

  def details
    { "total_value" => total_value, "player_count" => player_count }
  end

  def average_cost_of_player
    average_cost = (total_value / player_count).to_s.split("")

    average_cost_0 = average_cost[-8..-7].join
    average_cost_1 = average_cost[-6..-4].join
    average_cost_2 = average_cost[-3..-1].join

    "$#{average_cost_0},#{average_cost_1},#{average_cost_2}"
  end

  def players_by_last_name
    (@roster.map &:last_name).sort.join(", ")
  end
end
