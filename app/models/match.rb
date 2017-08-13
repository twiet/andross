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
#  tournament_id   :integer
#  player1_score   :integer
#  player2_score   :integer
#  max_score       :integer
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

  def update_player_score(player_id, newScore)
    if player_id == self.player1_id && newScore <= self.max_score
      self.player1_score = newScore
      self.save!
      advance(player1_id) if self.player1_score == self.max_score
    elsif player_id == player2_id && newScore <= self.max_score
      self.player2_score = newScore
      self.save!
      advance(player2_id) if self.player2_score == self.max_score
    end
  end

  def handle_bye
    if player1_id.nil? && player2_id.nil?
      return
    elsif player1_id.nil?
      winner_id = player2_id
    elsif player2_id.nil?
      winner_id = player1_id
    end

    advance(winner_id) unless winner_id.nil?
  end

  def advance(winner_id)
    byebug
    self.winner_id = winner_id
    self.save!

    next_match = Match.find_by(id: self.next_match_id)

    if next_match.player1_id.nil?
      next_match.player1_id = self.winner_id
    else
      next_match.player2.id = self.winner_id
    end
    next_match.save!

  end
end
