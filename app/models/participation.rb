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

class Participation < ApplicationRecord
  validates :player_id, :tournament_id, presence: true

  belongs_to :player,
  class_name: :User,
  primary_key: :id,
  foreign_key: :player_id
  
  belongs_to :tournament
end
