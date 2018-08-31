class User < ActiveRecord::Base
    has_secure_password

    has_many :games
    has_many :decks
    has_many :ccgs, through: :decks
end
