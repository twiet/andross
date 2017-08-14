json.extract! @tournament, :id, :creator_id, :tournament_name, :location, :date_start, :date_end, :registration_start, :registration_end, :registration_length, :is_published?, :is_finished?, :has_started?, :champion_id

json.players @tournament.players.each do |player|
  json.extract! player, :id, :email, :tag, :is_guest?, :phone_number
end

json.matches @tournament.matches.each do |match|
  json.extract! match, :id, :player1_id, :player2_id, :next_match_id, :station_number, :winner_id, :child_match1_id, :child_match2_id, :player1_score, :player2_score, :max_score
end
