class Deck < ActiveRecord::Base
    belongs_to :ccg
    has_many :games
    has_many :users
    has_many :tags, :through => :decktags

    def record_game
    end
end
