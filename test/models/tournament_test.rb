# == Schema Information
#
# Table name: tournaments
#
#  id                  :integer          not null, primary key
#  creator_id          :integer          not null
#  tournament_name     :string           not null
#  location            :string
#  date_start          :datetime         not null
#  date_end            :datetime         not null
#  registration_start  :datetime
#  registration_end    :datetime
#  registration_length :datetime
#  is_published?       :boolean          not null
#  is_finished?        :boolean          not null
#  has_started?        :boolean          not null
#  champion_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  max_score_per_round :integer
#

require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
