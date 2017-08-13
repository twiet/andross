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

class Match < ApplicationRecord

  belongs_to :tournament

  belongs_to :player1, optional: true,
  class_name: :User,
  foreign_key: :player1_id,
  primary_key: :id

  belongs_to :player2, optional: true,
  class_name: :User,
  foreign_key: :player2_id,
  primary_key: :id

  def cannot_play_self
    if self.player1_id == self.player2_id
      errors[:player1_id] << "same players in match!"
      errors[:player2_id] << "same players in match!"
    end
  end

  def advance(winner)
    #find next match and set one of the player_ids as the winner's
    if player1.id.nil?
      self.winner = player_2
    elsif player2.id.nil?
      self.winner = player1
    else
      self.winner = winner
    end

    next_match = self.next_match

    if self.next_match.player1_id.nil?
      self.next_match.player1_id = self.winner.id
    else
      self.next_match.player2.id = self.winner.id
    end

  end
end
