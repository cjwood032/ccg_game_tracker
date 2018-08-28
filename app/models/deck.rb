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
        if self.link!=nil
            if self.link.split('.').length==3
                self.link.split('.')[1]
            elsif self.link.split('.').length==2
                self.link.split('.')[0].split('/')[2]
            else
                "Link is Suspicious: Be Wary"
            end
        end
    end
end
