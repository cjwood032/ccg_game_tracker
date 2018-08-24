class GamesController < ApplicationController
    before_action :convert, only: [:create]
    def show
    end
    def index
        @game=Game.new
        @decks=current_user.decks
    end
    def create
        @game=Game.new(game_params)
        @game.deck_id=@deck.id
        binding.pry
        respond_to do |format|
            if @game.save
              @game=Game.new
              format.html { redirect_to index, notice: 'Game was successfully recorded.' }
            else
              format.html { render :index, notice: 'Game was not recorded!' }
            end
          end
      end

    private
      def convert
        @deck=Deck.find(params[:game][:deck])
      end
      def game_params
        #binding.pry
        params.permit(
        :user_id,
        :result,
        )
        
      end
end