class Deck < ActiveRecord::Base
    belongs_to :ccg
    has_many :games
    has_many :users, :through => :games
    has_many :tags, :through => :decktags


end
