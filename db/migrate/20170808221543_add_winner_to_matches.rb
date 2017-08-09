class AddWinnerToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :winner_id, :integer
  end
end
