# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  player1_id      :integer
#  player2_id      :integer
#  next_match_id   :integer
#  station_number  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  winner_id       :integer
#  child_match1_id :integer
#  child_match2_id :integer
#

require 'rails_helper'

RSpec.describe Match, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
