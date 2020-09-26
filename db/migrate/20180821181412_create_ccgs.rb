class CreateCcgs < ActiveRecord::Migration[5.2]
  def change
    create_table :ccgs do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
