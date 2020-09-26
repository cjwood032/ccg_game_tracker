class CreateJoinTableUserCcg < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :ccgs do |t|
      # t.index [:user_id, :ccg_id]
      # t.index [:ccg_id, :user_id]
    end
  end
end
