class RemoveConstraintsFromTournament < ActiveRecord::Migration[5.1]
  def change
    change_column :tournaments, :has_started?, :boolean, :null => true
    change_column :tournaments, :is_published?, :boolean, :null => true
    change_column :tournaments, :is_finished?, :boolean, :null => true
  end
end
