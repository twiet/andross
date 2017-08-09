class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :player_id, null: false
      t.integer :tournament_id, null: false

      t.timestamps
    end

    add_index :participations, :player_id
    add_index :participations, :tournament_id
  end
end
