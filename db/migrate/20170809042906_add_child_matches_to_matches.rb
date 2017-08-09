class AddChildMatchesToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :child_match1_id, :integer
    add_column :matches, :child_match2_id, :integer
  end
end
