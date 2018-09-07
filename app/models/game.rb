class Game < ActiveRecord::Base
    belongs_to :deck
    belongs_to :user
    has_many :game_tags
    has_many :tags, through: :game_tags
    validates :result, presence: true
end
