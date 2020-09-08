class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Username, :string
  end
end
