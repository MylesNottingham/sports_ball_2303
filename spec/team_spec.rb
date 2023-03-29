require "rspec"
require "./lib/player"
require "./lib/team"

RSpec.describe Team do
  before(:each) do
    @team = Team.new("Dodgers", "Los Angeles")
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
    before(:each) do
      @player_1 = Player.new("Michael Palledorous", 1000000, 36)
      @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    end

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
end
