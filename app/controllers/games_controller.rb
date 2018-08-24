class GamesController < ApplicationController

    def show
    end
    def index
        @game=Game.new
        @decks=current_user.decks
        #@decks=Deck.all
        binding.pry
    end
    def save
        @game=Game.new(game_params)
        respond_to do |format|
            if @game.save
              format.html { redirect_to index, notice: 'Game was successfully recorded.' }
            else
              format.html { render :index, notice: 'Game was not recorded!' }
            end
          end
      end

    private
      def game_params
        binding.pry
        params.permit(
        :user_id,
        :result,
        :deck
        
      )
      end
end