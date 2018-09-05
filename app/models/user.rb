class User < ActiveRecord::Base
    has_secure_password
    validates :Username, uniqueness: true
    has_many :games
    has_many :decks
    has_many :ccg_users
    has_many :ccgs, through: :ccg_users
end
