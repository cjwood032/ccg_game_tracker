class AddCommentsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :comment, :text
  end
end
