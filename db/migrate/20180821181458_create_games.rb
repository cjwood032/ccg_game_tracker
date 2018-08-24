class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :deck_id
      t.text :result
      t.text :opponent_deck

      t.timestamps
    end
  end
end
