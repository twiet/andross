class AddSeedToParticipations < ActiveRecord::Migration[5.1]
  def change
        add_column :participations, :seed, :integer
  end
end
