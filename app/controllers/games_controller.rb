class GamesController < ApplicationController
    before_action :get_deck, only: [:create]
    def show
    end
    def index
        @games=current_user.games
        @decks=current_user.decks
    end
    def new
      @game=Game.new
      @decks=current_user.decks
    end
    def show
      @game=Game.find(params[:id])
      #binding.pry
    end
    def create
        @game=Game.new(game_params)
        @game.deck_id=@deck.id
        
        respond_to do |format|
            if @game.save
                @deck.record_game(@game.result)
                @game=Game.new
                #binding.pry
                @decks=current_user.decks
              format.html { render :new, notice: 'Game was successfully recorded.' }
            else
              format.html { render :index, notice: 'Game was not recorded!' }
            end
          end
      end

    private
      def make_tags
        tags=[]
        Tag.all.each do |tag|
          if params.key?(tag.name)
            tags << tag
          end
        end
        @deck.tags=tags
      end

      def get_deck
        @deck=Deck.find(params[:game][:deck])
      end
      def game_params
        binding.pry
        params.permit(
        :user_id,
        :result,
        :tags
        )
        
      end
end