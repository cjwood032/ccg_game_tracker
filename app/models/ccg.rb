class Ccg < ActiveRecord::Base
    has_many :decks
    has_many :games
    has_many :users, through: :ccg_users
    has_many :ccg_users
end
