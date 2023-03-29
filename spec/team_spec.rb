require "rspec"
require "./lib/player"
require "./lib/team"

RSpec.describe Team do
  before(:each) do
    @team = Team.new("Dodgers", "Los Angeles")
    @player_1 = Player.new("Michael Palledorous", 1000000, 36)
    @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    @player_3 = Player.new("Alan McClennan", 750000, 48)
    @player_4 = Player.new("Hamilton Porter", 100000, 12)
  end

  describe "#initialize" do
    it "exists" do
      expect(@team).to be_a Team
    end

    it "begins with an empty roster" do
      expect(@team.roster).to eq([])
    end

    it "begins with no players" do
      expect(@team.player_count).to eq(0)
    end
  end

  describe "#add_player" do
    it "the players exist" do
      expect(@player_1).to be_a Player
      expect(@player_2).to be_a Player
    end

    it "can add players" do
      expect(@team.roster).to eq([])
      expect(@team.player_count).to eq(0)

      @team.add_player(@player_1)

      expect(@team.roster).to eq([@player_1])
      expect(@team.player_count).to eq(1)

      @team.add_player(@player_2)

      expect(@team.roster).to eq([@player_1, @player_2])
      expect(@team.player_count).to eq(2)
    end
  end

  describe "#long_term_players" do
    it "can return long term players" do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.roster).to eq([@player_1, @player_2, @player_3, @player_4])
      expect(@team.player_count).to eq(4)
      expect(@team.long_term_players).to eq([@player_1, @player_3])
    end
  end

  describe "#short_term_players" do
    it "can return short term players" do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.roster).to eq([@player_1, @player_2, @player_3, @player_4])
      expect(@team.player_count).to eq(4)
      expect(@team.short_term_players).to eq([@player_2, @player_4])
    end
  end

  describe "#total_value" do
    it "can return total value" do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.roster).to eq([@player_1, @player_2, @player_3, @player_4])
      expect(@team.player_count).to eq(4)
      expect(@team.total_value).to eq(85200000)
    end
  end

  describe "#details" do
    it "can return details" do
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)

      expect(@team.roster).to eq([@player_1, @player_2, @player_3, @player_4])
      expect(@team.player_count).to eq(4)
      expect(@team.details).to eq({ "total_value" => 85200000, "player_count" => 4 })
    end
  end
end
