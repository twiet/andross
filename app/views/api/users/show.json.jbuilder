json.extract! @user, :id, :email, :tag, :is_guest?, :phone_number

json.created_tournaments @user.created_tournaments.each do |tournament|
  json.extract! tournament, :id, :creator_id, :tournament_name, :location, :date_start, :date_end, :registration_start, :registration_end, :registration_length, :is_published?, :is_finished?, :has_started?, :champion_id
end

json.participated_tournaments @user.participated_tournaments.each do |tournament|
  json.extract! tournament, :id, :creator_id, :tournament_name, :location, :date_start, :date_end, :registration_start, :registration_end, :registration_length, :is_published?, :is_finished?, :has_started?, :champion_id
end
