class GamesController < ApplicationController
    before_action :set_deck, only: [:index, :new]
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
    end

    def new
      @game=Game.new
      @decks=current_user.decks  
    end

    def delete
      current_user.games.last.destroy
      respond_to do |format|
        format.html { redirect_to games_path, notice: 'Game was deleted' }
      end
    end

    def show
      @game=Game.find(params[:id])
    end

    def create
      if params[:deck_id]!=nil
        #binding.pry
        set_deck
        @game=Game.new(game_params)
        @game.deck_id=@deck.id
        @game.user_id=current_user.id
        @route="/decks/#{@deck.id}/games/new"
      elsif params[:action]=="create"&& params[:game][:deck_id]!=""
        #binding.pry
        @game=Game.new(game_params)
        @route="/games/new"
        @deck=Deck.find(id=@game.deck_id)
        @game.user_id=current_user.id
      else
          #binding.pry
          @route="/games/new"
          @decks=current_user.decks
      end
      respond_to do |format|
        if (!!@game)
          make_tags(@game)      
        
          if @game.save
              @deck.record_game(@game.result)
              @game=Game.new
              @decks=current_user.decks
              format.html { redirect_to @route, notice: 'Game was successfully recorded.' }
            else
              @decks=current_user.decks
              format.html { redirect_to @route, notice: 'Game was not recorded, you need to select a result' }
          end
        
        else 
          @decks=current_user.decks
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
      def get_deck
        @deck=Deck.find_by_id(params[:game][:deck_id])
      end

      def game_params
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