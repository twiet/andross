# == Schema Information
#
# Table name: participations
#
#  id            :integer          not null, primary key
#  player_id     :integer          not null
#  tournament_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  seed          :integer
#

require 'rails_helper'

RSpec.describe Participation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
