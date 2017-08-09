class Match < ApplicationRecord

  belongs_to :tournament

  has_one :player1,
  class_name: :User,
  foreign_key: :player1_id,
  primary_key: :id

  has_one :player2,
  class_name: :User,
  foreign_key: :player2_id,
  primary_key: :id

  def cannot_play_self
  if self.player_1_id == self.player_2_id
    errors[:player1_id] << "same players in match!"
    errors[:player2_id] << "same players in match!"
  end

  def advance(winner)
    #find next match and set one of the player_ids as the winner's
    if player1.tag == "_BYE_"
      self.winner = player_2
    elsif player2.tag == "_BYE_"
      self.winner = player1
    else
      self.winner = winner
    end

    if self.next_match.player1_id.nil?
      self.next_match.player1_id = self.winner.id
    else
      self.next_match.player2.id = self.winner.id
    end

  end
end

end
