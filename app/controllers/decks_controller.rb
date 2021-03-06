class DecksController < ApplicationController
    before_action :set_deck, only: [:show, :edit, :update, :destroy]
    def index
        @decks=current_user.decks
        @user=current_user
    end

    def show
        @tags=@deck.tag_count
    end

    def edit
        @deck = Deck.find(params[:id])
    end

    def new
        @deck=Deck.new
    end

    def create
        @deck= Deck.new(deck_params)
        @deck.user_id=current_user.id
        @deck.wins=0
        @deck.losses=0
        respond_to do |format|
            if @deck.save
              format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
            else
              format.html { redirect_to new_deck_url, notice: "Deck was not created, the name can't be blank"}
            end
          end
    end
    
    def update
        respond_to do |format|
            if @deck.update(deck_params)
              format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
            else
              format.html { render :edit }
            end
        end
    end

    def destroy
        @deck.destroy
        respond_to do |format|
          format.html { redirect_to decks_url, notice: 'Deck was successfully deleted.' }
        end
    end
    
    def good
        @user=current_user
    end
    
    private
    def set_deck
        @deck=Deck.find(params[:id])
    end

    def deck_params
        params.require(:deck).permit(
            :name,
            :ccg_id,
            :link
        )
    end
end