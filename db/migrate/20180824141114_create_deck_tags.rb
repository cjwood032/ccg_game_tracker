class CreateDeckTags < ActiveRecord::Migration[5.2]
  def change
    #drop_table :deck_tags
    create_table :decktags do |t|
      t.integer :deck_id
      t.integer :tag_id
    end
  end
end
