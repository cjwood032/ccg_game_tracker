class Tag < ApplicationRecord
    has_many :games_tags
    has_many :games, through: :game_tags
    has_many :decks, through: :games
end
