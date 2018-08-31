class DeleteDeckTags < ActiveRecord::Migration[5.2]
    def change
      drop_table :deck_tags
    end
  end
  