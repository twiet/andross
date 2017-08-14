@tournaments.each do |tournament|
  json.set! tournament.id do
    json.extract! tournament, :id, :creator_id, :tournament_name, :location, :date_start, :date_end, :registration_start, :registration_end, :registration_length, :is_published?, :is_finished?, :has_started?, :champion_id
  end
end
