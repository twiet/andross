class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :next_match_id
      t.integer :station_number
      t.timestamps
    end
  end
end
