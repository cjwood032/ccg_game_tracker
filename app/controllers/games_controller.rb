class GamesController < ApplicationController
    before_action :get_deck, only: [:create]
    def show
    end
    def index
        @games=current_user.games.select{|g| g.created_at.today?}
        @last_game=@games.last
        @games.reverse!
        #binding.pry
    end
    def new
      @game=Game.new
      @decks=current_user.decks
      #binding.pry
    end
    def delete
      #binding.pry
      current_user.games.last.destroy
      respond_to do |format|
        format.html { redirect_to games_path, notice: 'Game was deleted' }
      end
    end
    def show
      @game=Game.find(params[:id])
      #binding.pry
    end
    def create
        @game=Game.new(game_params)
        @game.user_id=current_user.id
        make_tags(@game)
        #binding.pry
        respond_to do |format|
            if @game.save
                #binding.pry
                @deck.record_game(@game.result)
                @game=Game.new
               #binding.pry
                @decks=current_user.decks
              format.html { render :new, notice: 'Game was successfully recorded.' }
            else
              @decks=current_user.decks
              format.html { render :new, notice: 'Game was not recorded!' }
            end
          end
      end

    private
      def make_tags(arg)
        arg.tag_ids=params[:game][:tag_ids]
      end

      def get_deck
        @deck=Deck.find(params[:game][:deck_id])
      end
      def game_params
        #binding.pry
        params.require(:game).permit(
        :user_id,
        :deck_id,
        :result,
        :tag_ids,
        :comment,
        :opponent_deck
        )
      end
end