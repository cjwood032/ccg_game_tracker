class User < ActiveRecord::Base
    has_secure_password
    validates :Username, uniqueness: true
    has_many :games
    has_many :decks
    has_many :ccgs, through: :decks
end
