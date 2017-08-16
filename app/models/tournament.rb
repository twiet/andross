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

  def is_power_of_two?(num)
    while (num % 2 == 0 and num != 0)
      num /= 2
    end
    num == 1
  end

  def num_byes(num_players)
    num_players_with_byes = self.players.length
    until is_power_of_two?(num_players_with_byes)
      num_players_with_byes += 1
    end
    num_players_with_byes - num_players
  end

  def generate_matches
    #self.players = self.players.shuffle
    idx = 0
    num_players = self.players.length
    num_byes = num_byes(num_players)
    num_players_with_byes = num_players + num_byes
    while idx < num_players_with_byes / 2
      player1 = players[idx]
      unless idx < num_byes
        player2 = players[num_players_with_byes - 1 - idx]
        player2_id = player2.id
      else
        player2_id = nil
      end
      new_match = Match.new(
        player1_id: player1.id,
        player2_id: player2_id,
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

  def start_tournament
    self.matches.each do |match|
      match.max_score = self.max_score_per_round
      match.player1_score = 0
      match.player2_score = 0
      match.save!
      match.handle_bye
    end
  end

end
