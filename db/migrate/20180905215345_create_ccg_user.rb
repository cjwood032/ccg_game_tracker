class CreateCcgUser < ActiveRecord::Migration[5.2]
  def change
    drop_table :ccgs_users
    create_table :ccg_users do |t|
      t.integer :ccg_id
      t.integer :user_id
    end
  end
end
