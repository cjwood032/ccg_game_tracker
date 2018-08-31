class Ccg < ActiveRecord::Base
    has_many :decks
    has_many :games
    has_many :users, through: :decks
end
