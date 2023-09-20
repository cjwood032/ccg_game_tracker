class AddColorsToDeck < ActiveRecord::Migration[7.0]
  def change
    add_column :decks, :color, :integer, default: 0
  end
end
