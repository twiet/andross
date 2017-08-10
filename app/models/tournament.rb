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
#

# Tournament.new(creator_id: 1, tournament_name: "KevinSucks", date_start: date, date_end: date2, is_published?: false, is_finished?: false, is_started?: false)
require 'byebug'
class Tournament < ApplicationRecord

  validates :creator_id, :tournament_name, :date_start, :date_end, :is_published?, :is_finished?, :has_started?, presence: true

  has_many :matches

  has_many :participations

  has_many :players,
  through: :participations,
  source: :player

  belongs_to :creator,
  primary_key: :id,
  foreign_key: :creator_id,
  class_name: :User

  #TO DISCUSS:
  # Flow 1:
  # Start with blank players array when tournament is created. TO makes post requests to add players to the array

  # Flow 2:
  # TO maintains player list on frontend (implement local storage in case he exits by accident) while registering.
  # Tournament is only created with complete player list.

  #Flows converge:

  def is_power_of_two?(num)
    while (num % 2 == 0 and num != 0)
      num /= 2
    end
    num == 1
  end

  def insert_byes
    length = self.players.length
    until length.is_power_of_two?
      self.players << User.new(
        tag: "_BYE_"
      )
    end
  end

  def generate_matches
    idx = 0
    players = self.players
    while idx < players.length / 2
      player1 = players[idx]
      player2 = players[players.length - 1 - idx]
      new_match = Match.new(
        player1_id: player1.id,
        player2_id: player2.id,
        station_number: idx + 1,
        tournament_id: self.id
        )
      new_match.save!
      self.matches << new_match
      idx += 1
    end

    self.matches = generate_future_matches(self.matches)
  end

  def generate_future_matches(matches)
    return matches if matches.length <= 1
    new_matches = []
    idx = 0

    while idx < matches.length / 2
      match1 = matches[idx]
      match2 = matches[matches.length - 1 - idx]

      new_match = Match.new(tournament_id: self.id)
      new_match.save!

      match1.update_attributes(next_match_id: new_match.id)
      match2.update_attributes(next_match_id: new_match.id)

      new_match.update_attributes({
          child_match1_id: match1.id,
          child_match2_id: match2.id
        })

      new_matches << new_match
      idx +=1
    end

    return matches += generate_future_matches(new_matches)
  end


end
