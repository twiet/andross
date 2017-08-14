class MaxScorePerRound < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :max_score_per_round, :integer
  end
end
