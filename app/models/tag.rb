class Tag < ApplicationRecord
    has_many :decks, :through => :decktags
end
