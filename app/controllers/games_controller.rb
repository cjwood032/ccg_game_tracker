class GamesController < ApplicationController
    before_action :set_deck, only: [:create_withdeck, :index, :new]
    def show
    end
    def index
        if @deck
          @games=current_user.games.where(deck: @deck).select{|g| g.created_at.today?}
        else
          @games=current_user.games.select{|g| g.created_at.today?}
        end
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
    def create_withdeck
      @game=Game.new(game_params)
      @game.deck_id=@deck.id
      @route="/decks/#{:deck_id}/games/new"
      #binding.pry
      create
    end
    def create
      if !@game
        @game=Game.new(game_params)
        @route="/games/new"
        @deck=Deck.find(id=@game.deck_id)
      end
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
          format.html { redirect_to @route, notice: 'Game was successfully recorded.' }
        else
          @decks=current_user.decks
          @message="You need to select a result."
          #binding.pry
          format.html { redirect_to @route, notice: 'Game was not recorded, you need to select a result' }
        end
      end
    end
    def good
    end

    private
      def make_tags(arg)
        arg.tag_ids=params[:game][:tag_ids]
      end

      def set_deck
        @deck=Deck.find_by_id(params[:deck_id])
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