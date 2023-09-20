class Deck < ActiveRecord::Base
    belongs_to :ccg
    has_many :games
    belongs_to :user
    has_many :games
    has_many :tags, through: :games
    validates :name, presence: true
    validates :ccg, presence: true
    scope :wlratio, -> {where("decks.wins>decks.losses")} 
    # enum color: [
    #     :Colorless,
    #     :White,
    #     :Blue,
    #     :Black,
    #     :Red,
    #     :Green

    # ]
    enum color: {
        Colorless: 0,
        White: 1,    
        Blue: 2,
        Black: 3,
        Red: 4,
        Green: 5,
        Azorious: 6,
        Dimir: 7,
        Rakdos: 8,
        Gruul: 9,
        Selesnya: 10,
        Orzhov: 11,
        Izzet: 12,
        Golgari: 13,
        Boros: 14,
        Simic: 15,
        #Shards
        Bant: 16,
        Esper: 17,
        Grixis: 18,
        Jund: 19,
        Naya: 20,
        #Wedges
        Abzan: 21,
        Jeskai: 22,
        Sultai: 23,
        Mardu: 24,
        Temur: 25,
        #4 colors
        UBRG: 26,
        WBRG: 27,
        WURG: 28,
        WUBG: 29,
        WUBR: 30,
        #5 color
        WUBRG: 31
    }
    def record_game(result)
        if result == "Win" 
            self.update(:wins=> self.wins+=1)
        else
            self.update(:losses=> self.losses+=1)
        end
    end

    def short_link
        if self.link!=""||nil
            if self.link.split('.').length==3
                self.link.split('.')[1]
            elsif self.link.split('.').length==2
                self.link.split('.')[0].split('/')[2]
            else
                "Link is Suspicious: Be Wary"
            end
        end
    end
    def tag_count
        tags=[]
        self.games.each do |game|
            game.tags.each do |tag|
                tags << tag  
            end
        end
        tags  
    end




end
