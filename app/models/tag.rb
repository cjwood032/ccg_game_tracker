class Tag < ApplicationRecord
    has_many :deck_tags
    has_many :decks, through: :deck_tags
end
