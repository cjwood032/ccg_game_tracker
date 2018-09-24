class User < ActiveRecord::Base
    has_secure_password
    validates :Username, uniqueness: true
    validates :Username, presence: true
    has_many :games
    has_many :decks
    has_many :ccg_users
    has_many :ccgs, through: :ccg_users
    #scope :same, -> {where("user.games==currrent_user.games")}

    def samegame(ccg)
        User.all.select{ |user|
            user!=self && user.ccgs.include?(ccg)
        }
    end
end
