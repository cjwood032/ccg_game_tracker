class Deck < ActiveRecord::Base
    belongs_to :ccg
    has_many :games
    has_many :users
    has_many :tags, :through => :decktags

    def record_game(result)
        if result == "Win" 
            self.update(:wins=> self.wins+=1)
        else
            self.update(:losses=> self.losses+=1)
        end
    end
    def short_link
        if @deck.link
            short_link=@deck.link[4..13]
        end
    end
end
