class CreateDeckTags < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_tags do |t|
      t.integer :deck_id
      t.integer :tag_id
    end
  end
end
