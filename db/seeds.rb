# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
  :user_keys =>
    ["name", "Username","password"],
  :users => [
    ["chris", "chris", "password"]
  ],
  :deck_keys =>
    ["name", "user_id", "ccg_id", "wins", "losses", "link"],
  :decks => [
    ["Omnidoorthragfire", "2", "1", "100", "0","www.magiccards.info"],
    ["Esper Crown", "2", "2", "10", "5","www.eternalwarcry.com/"]
  ],
  :ccg_keys => ["name"],
  :ccgs => [
    ["Commander"],
    ["Standard"],
    ["Pioneer"],
    ["Modern"],
    ["Alchemy"],
    ["Explorer"],
    ["Historic"],
    ["Pauper"],
    ["Brawl"],
    ["Legacy"],
    ["Vintage"],
    ["Casual"]
  ],
  
  :game_keys => ["deck_id", "result"],
  :games => [
  ["1", "Win"],
  ["2", "Loss"]
  ],
  :tag_keys => ["name"],
  :tags => [
    ["Resource Shortage"],
    ["Resource Excess"],
    ["Opponent Resource Shortage"],
    ["Opponent Resource Excess"],
    ["Blowout-Win"],
    ["Blowout-Loss"],
    ["Bad Draw"],
    ["Opponent Bad Draw"],
    ["Play Mistake"],
    ["Opponent Play Mistake"],
    ["Bad Matchup"]
  ]
}

def main
  make_users
  make_decks
  make_ccgs
  make_games
  make_tags
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end
def make_decks
  DATA[:decks].each do |deck|
    new_deck = Deck.new
    deck.each_with_index do |attribute, i|
      new_deck.send(DATA[:deck_keys][i]+"=", attribute)
    end
    new_deck.save
  end
end
def make_ccgs
  DATA[:ccgs].each do |ccg|
    new_ccg = Ccg.new
    ccg.each_with_index do |attribute, i|
      new_ccg.send(DATA[:ccg_keys][i]+"=", attribute)
    end
    new_ccg.save
  end
end
def make_games
  DATA[:games].each do |game|
    new_game = Game.new
    game.each_with_index do |attribute, i|
      new_game.send(DATA[:game_keys][i]+"=", attribute)
    end
    new_game.save
  end
end
def make_tags
  DATA[:tags].each do |tag|
    new_tag = Tag.new
    tag.each_with_index do |attribute, i|
      new_tag.send(DATA[:tag_keys][i]+"=", attribute)
    end
    new_tag.save
  end
end
main
