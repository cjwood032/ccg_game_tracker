class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
      t.integer :user_id
      t.integer :ccg_id
      t.string :link
      t.timestamps
    end
  end
end
