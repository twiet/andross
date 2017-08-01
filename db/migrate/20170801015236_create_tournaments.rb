class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.integer :creator_id, null: false
      t.string :tournament_name, null: false
      t.string :location
      t.datetime :date_start, null: false
      t.datetime :date_end, null: false
      t.datetime :registration_start
      t.datetime :registration_end
      t.datetime :registration_length
      t.boolean :is_published?, null: false
      t.boolean :is_finished?, null: false
      t.boolean :has_started?, null: false
      t.integer :champion_id

      t.timestamps
    end

    add_index :tournaments, :creator_id
    add_index :tournaments, :location
    add_index :tournaments, :date_start
    add_index :tournaments, :tournament_name

  end
end
