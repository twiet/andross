class AddScoringToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :player1_score, :integer
    add_column :matches, :player2_score, :integer
    add_column :matches, :max_score, :integer
  end
end
