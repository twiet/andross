require 'rails_helper'
begin
  Tournament
rescue
  Tournament = nil
end

RSpec.describe Tournament, :type => :model do

  describe "has_started" do
    it "should not default to having started already" do
      tourney = Tournament.create(tournament_name: "testtourney", date_start: DateTime.new(2001,2,3)  , date_end:DateTime.new(2001,2,3) , is_published?: false, is_finished?: false, has_started?: false)
      expect(tourney.has_started?).not_to be true
    end
  end

  it { should validate_presence_of(:tournament_name) }
  it { should validate_presence_of(:date_start) }
  it { should validate_presence_of(:date_end) }

  # it { should validate_presence_of(:is_published?) }
  # it { should validate_presence_of(:is_finished?) }
  # it { should validate_presence_of(:has_started?) }

  # it { should belong_to(:author) }
  # it { should have_many(:comments) }
  # it { should have_many(:completions) }
end
