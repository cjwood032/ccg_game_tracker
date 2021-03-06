class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :decks_index]

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def new
    @user = User.new
    current_user=@user
  end

  def index
  end

  def create
    @user = User.new(user_params)
    @user.ccg_ids=params[:user][:ccg_ids]
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user), notice: "Let's get some wins!" }
      else
        format.html { render :new }
      end
    end
  end
  
  def decks_index
    @decks=@user.decks
    render template: 'decks/index'
  end
  
  def edit
    respond_to do |format|
      if @user==current_user
        format.html { render :edit}
      else
        format.html { redirect_to user_path(@user), notice: "You can only edit your own page!" }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.ccg_ids=params[:user][:ccg_ids]
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  def same
  end

  private
    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(
        :name,
        :Username,
        :ccg_ids,
        :password
      )
    end  
end