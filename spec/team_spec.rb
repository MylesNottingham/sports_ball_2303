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
end
